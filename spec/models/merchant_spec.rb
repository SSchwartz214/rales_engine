require 'rails_helper'

describe Merchant do
  describe 'validations' do
    it {should validate_presence_of :name}
  end
  describe 'instance methods' do
    it "returns the total revenue" do
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

      expect(merchant.total_revenue).to eq(1000)
    end

    xit "returns the total revenue by date" do
      date = "2012-03-25 13:54:11"
      merchant = create(:merchant)
      invoice_1 = create(:invoice, created_at: date, merchant_id: merchant.id)
      invoice_2 = create(:invoice, created_at: date, merchant_id: merchant.id)
      transaction_1 = invoice_1.transactions.create(invoice_id: invoice_1.id, result: "success")
      transaction_2 = invoice_2.transactions.create(invoice_id: invoice_2.id, result: "success")
      invoice_item_1 = invoice_1.invoice_items.create(invoice_id: invoice_1.id, unit_price: 1000, quantity: 2)
      invoice_item_2 = invoice_1.invoice_items.create(invoice_id: invoice_2.id, unit_price: 500, quantity: 2)

      expect(merchant.total_revenue_by_date(date)).to eq(3000)
    end
  end
end
