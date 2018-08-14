require 'rails_helper'

describe "Invoices API" do
  it "returns a list of invoices" do
    customer = Customer.create(first_name: "Gil", last_name: "Blargh")
    merchant = Merchant.create(name: "Blah")
    invoice = Invoice.create(status: "shipped", customer_id: customer.id, merchant_id: merchant.id)

    get "/api/v1/invoices"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)

    expect(invoices[0]["id"]).to eq(invoice.id)
  end
end
