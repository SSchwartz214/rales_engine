require 'rails_helper'

describe 'Merchants API' do
  it 'sends a list of merchants' do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)
    expect(merchants.count).to eq(3)
  end

  # it 'calculates the revenue of a merchant' do
  #   merchant = merchant.create(name: "Mike")
  #   item_1 = Item.create(name: "sdfsd", description: "dsfa", unit_price: 1, merchant: merchant)
  #   item_2 = Item.create(name: "sdfsd", description: "dsfa", unit_price: 2, merchant: merchant)
  #   invoice_item_1 = InvoiceItem.create(item: item_1)
  # end



end
