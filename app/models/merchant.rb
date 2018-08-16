class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  def total_revenue
      invoices
      .joins(:transactions, :invoice_items)
      .merge(Transaction.success)
      .sum('invoice_items.quantity * invoice_items.unit_price')
  end

  def total_revenue_by_date(date)#"2012-03-25 13:54:11"
    invoices
    .where(invoices: {created_at: date})
    .joins(:transactions, :invoice_items)
    .merge(Transaction.success)
    .sum('invoice_items.quantity * invoice_items.unit_price')
  end

end
