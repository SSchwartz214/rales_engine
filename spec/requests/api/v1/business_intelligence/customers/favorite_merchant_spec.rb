require 'rails_helper'

describe 'Customers API' do
  xit 'loads favorite merchant associated with one customer' do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)

    customer = create(:customer)

    invoice_1 = create(:invoice, merchant: merchant_1, customer: customer)
    invoice_2 = create(:invoice, merchant: merchant_1, customer: customer)
    invoice_3 = create(:invoice, merchant: merchant_2, customer: customer)

    get "/api/v1/customers/#{customer.id}/favorite_merchant"

    expect(response).to be_successful
    merchant = JSON.parse(response.body)

    expect(merchant["id"]).to eq(merchant_1.id)
  end
end
