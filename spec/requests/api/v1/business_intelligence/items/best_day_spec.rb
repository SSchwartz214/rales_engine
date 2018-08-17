require 'rails_helper'

describe 'Items API' do
  xit 'loads the best day associated with one item' do
    item = create(:item)
    invoice_1 = create(:invoice, created_at: "2012-02-10")
    invoice_2 = create(:invoice, created_at: "2010-03-12")
    invoice_item_1 = create(:invoice_item, invoice: invoice_1, item: item)
    invoice_item_2 = create(:invoice_item, invoice: invoice_1, item: item)
    invoice_item_3 = create(:invoice_item, invoice: invoice_2, item: item)

    get "/api/v1/items/#{item.id}/best_day"
save_and_open_page

    expect(response).to be_successful
    best_day = JSON.parse(response.body)
    expect(best_day).to eq("2012-02-10T00:00:00.000Z")
  end
end
