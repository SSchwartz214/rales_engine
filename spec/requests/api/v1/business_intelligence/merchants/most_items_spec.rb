require 'rails_helper'

describe 'Merchants API' do
  it 'loads a variable number of top merchants ranked by total items sold' do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)

    item_1 = create(:item, merchant: merchant_1)
    item_2 = create(:item, merchant: merchant_2)

    invoice_1 = create(:invoice, merchant: merchant_1)
    invoice_2 = create(:invoice, merchant: merchant_2)

    invoice_item_1 = create(:invoice_item, invoice: invoice_1, quantity: 5, item: item_1)
    invoice_item_2 = create(:invoice_item, invoice: invoice_2, quantity: 10,  item: item_2)

    transaction_1 = create(:transaction, invoice: invoice_1, result: "success")
    transaction_2 = create(:transaction, invoice: invoice_2, result: "success")

    get "/api/v1/merchants/most_items?quantity=#{2}"

    expect(response).to be_successful
    merchants = JSON.parse(response.body)
    expect(merchants.first["id"]).to eq(merchant_2.id)
  end
end
