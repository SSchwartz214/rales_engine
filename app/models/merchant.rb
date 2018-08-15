class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def total_revenue
      invoices
      .joins(:transactions, :invoice_items)
      .merge(Transaction.success)
      .sum('invoice_items.quantity * invoice_items.unit_price')
  end

end
