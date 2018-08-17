class Item < ApplicationRecord
  validates_presence_of :name, :description, :unit_price

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.most_revenue(quantity)
    Item
    .joins(:invoice_items)
    .group(:id)
    .select('sum(invoice_items.unit_price * invoice_items.quantity) AS total_revenue', :id, :name)
    .order('total_revenue desc')
    .limit(quantity)
  end

  def best_day
    day = invoices
    .joins(:invoice_items)
    .select('invoices.created_at, sum(invoice_items.quantity) AS total')
    .joins(:transactions)
    .merge(Transaction.unscoped.success)
    .group('invoices.created_at')
    .order('total desc').limit(1)
    .first.created_at

    {"best_day": day}
  end

  def self.most_items(quantity)
    select('items.*, sum(invoice_items.quantity) AS total_quantity')
    .joins(:invoice_items, invoices: :transactions)
    .merge(Transaction.unscoped.success)
    .group(:id)
    .order('total_quantity desc')
    .limit(quantity)
  end
end
