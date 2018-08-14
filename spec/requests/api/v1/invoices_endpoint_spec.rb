require 'rails_helper'

describe "Invoices API" do
  it "returns a list of invoices" do
    create_list(:customer, 3)
    create_list(:merchant, 3)
    create_list(:invoice, 3)

    get "/api/v1/invoices"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(3)
  end
end
