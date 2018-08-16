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

  def total_revenue_by_date(date)
    new_date = Date.parse(date)
    invoices
    .where(invoices: {created_at: new_date.beginning_of_day..new_date.end_of_day})
    .joins(:transactions, :invoice_items)
    .merge(Transaction.success)
    .sum('invoice_items.quantity * invoice_items.unit_price')
  end

  def self.total_revenue_by_date(date)
    new_date = Date.parse(date)
    Merchant.joins(:invoice_items)
    .distinct
    .where(invoices: {created_at: new_date.beginning_of_day..new_date.end_of_day})
    .joins(:transactions)
    .where("transactions.result='success'")
    # .sum('invoice_items.unit_price * invoice_items.quantity')
  end

end
