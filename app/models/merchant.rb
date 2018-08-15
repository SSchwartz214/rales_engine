class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices

  def revenue
    {
    revenue:
      (invoices
      .joins(:transactions, :invoice_items)
      .merge(Transaction.success)
      .sum('invoice_items.quantity * invoice_items.unit_price')
      .to_f / 100.round(2)).to_json
    }
  end
end
