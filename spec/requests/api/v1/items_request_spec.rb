require 'rails_helper'

describe 'Items Api' do
  it 'returns the items ranked by most revenue' do
    merchant = Merchant.create(name: "Befv")
    item_1 = merchant.items.create(name: "rfe", description: "edfve", unit_price: 4344)
    item_2 = merchant.items.create(name: "3gf", description: "erver", unit_price: 2345)
    customer = Customer.create(first_name: "3fref", last_name: "34fd")
    invoice_1 = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
    invoice_2 = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
    invoice_item_1 = InvoiceItem.create(invoice_id: invoice_1.id, item_id: item_1.id, quantity: 20, unit_price: item_1.unit_price)
    invoice_item_2 = InvoiceItem.create(invoice_id: invoice_2.id, item_id: item_2.id, quantity: 20, unit_price: item_2.unit_price)

    get '/api/v1/items/most_revenue?quantity=1'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.count).to eq(1)

    expect(items[0]["id"]).to eq(item_1.id)
  end
end
