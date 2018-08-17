require 'rails_helper'

describe 'Items API' do
  it 'loads a variable number of top items ranked by total number sold' do
    item_1 = create(:item)
    item_2 = create(:item)

    invoice_1 = create(:invoice, created_at: "2012-02-10")

    invoice_item_1 = create(:invoice_item, invoice: invoice_1, item: item_1)
    invoice_item_2 = create(:invoice_item, invoice: invoice_1, item: item_1)
    invoice_item_3 = create(:invoice_item, invoice: invoice_1, item: item_2)

    get "/api/v1/items/most_items?quantity=2"

    expect(response).to be_successful
    most_items = JSON.parse(response.body)
    expect(most_items).to eq(2)
  end
end
