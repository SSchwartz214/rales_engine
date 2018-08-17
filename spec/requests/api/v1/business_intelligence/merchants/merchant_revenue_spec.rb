require 'rails_helper'

describe 'Merchants API' do
  it 'calculates the revenue of a merchant' do
    merchant = create(:merchant)
    customer_1 = create(:customer)
    customer_2 = create(:customer)
    item_1 = merchant.items.create(name: "Knife", description: "EWfewfewf", unit_price: 423)
    item_2 = merchant.items.create(name: "Flamethrower", description: "werfwrerw", unit_price: 577)
    invoice_1 = merchant.invoices.create(customer_id: customer_1.id, status: "shipped")
    invoice_2 = merchant.invoices.create(customer_id: customer_2.id, status: "shipped")
    invoice_item_1 = invoice_1.invoice_items.create(invoice_id: invoice_1.id, item_id: item_1.id, quantity: 1, unit_price: item_1.unit_price)
    invoice_item_2 = invoice_2.invoice_items.create(invoice_id: invoice_2.id, item_id: item_2.id, quantity: 1, unit_price: item_2.unit_price)
    transaction_1 = invoice_1.transactions.create(credit_card_number: "234432234", result: "failed")
    transaction_2 = invoice_1.transactions.create(credit_card_number: "234432237", result: "success")
    transaction_3 = invoice_2.transactions.create(credit_card_number: "234432237", result: "success")

    get "/api/v1/merchants/#{merchant.id}/revenue"

    expect(response).to be_successful

    revenue = JSON.parse(response.body)
    expect(revenue).to eq({"revenue"=>"10.0"})
  end

  it 'calculates the revenue of a merchant by date' do
    date = "2012-10-31"
    merchant = create(:merchant)
    item = create(:item)
    customer = create(:customer)
    invoice_1 = merchant.invoices.create(customer_id: customer.id, status: "shipped", updated_at: Date.parse(date))
    invoice_2 = merchant.invoices.create(customer_id: customer.id, status: "shipped")
    transaction_1 = Transaction.create(credit_card_number: '1234', credit_card_expiration_date: '10/11/12', result: "success", invoice_id: invoice_1.id)
    transaction_2 = Transaction.create(credit_card_number: '1234', credit_card_expiration_date: '10/11/12', result: "success", invoice_id: invoice_2.id)
    invoice_item1 = InvoiceItem.create(item_id: item.id, invoice_id: invoice_1.id, quantity: 1, unit_price: 1000)
    invoice_item2 = InvoiceItem.create(item_id: item.id, invoice_id: invoice_2.id, quantity: 2, unit_price: 1000)

    get "/api/v1/merchants/#{merchant.id}/revenue?=2012-03-16"

    expect(response).to be_successful

    revenue = JSON.parse(response.body)
    expect(revenue).to eq({"revenue"=>"30.0"})
  end
  it 'loads variable number of top merchants ranked by total revenue' do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    customer_1 = create(:customer)
    customer_2 = create(:customer)
    item_1 = merchant_1.items.create(name: "Knife", description: "EWfewfewf", unit_price: 423)
    item_2 = merchant_2.items.create(name: "Flamethrower", description: "werfwrerw", unit_price: 577)
    invoice_1 = merchant_1.invoices.create(customer_id: customer_1.id, status: "shipped")
    invoice_2 = merchant_2.invoices.create(customer_id: customer_2.id, status: "shipped")
    invoice_item_1 = invoice_1.invoice_items.create(invoice_id: invoice_1.id, item_id: item_1.id, quantity: 1, unit_price: item_1.unit_price)
    invoice_item_2 = invoice_2.invoice_items.create(invoice_id: invoice_2.id, item_id: item_2.id, quantity: 1, unit_price: item_2.unit_price)
    transaction_1 = invoice_1.transactions.create(credit_card_number: "234432234", result: "failed")
    transaction_2 = invoice_1.transactions.create(credit_card_number: "234432237", result: "success")
    transaction_3 = invoice_2.transactions.create(credit_card_number: "234432237", result: "success")

    get "/api/v1/merchants/most_revenue?=2"

    expect(response).to be_successful

    revenue = JSON.parse(response.body)
    expect(revenue).to eq([{"id"=>6, "name"=>"Seller1"}, {"id"=>7, "name"=>"Seller1"}])
  end
end
