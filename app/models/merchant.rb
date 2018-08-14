class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices

  has_many :items

  def revenue
    (invoice_items.sum('invoice_items.unit_price * invoice_items.quantity').to_f / 100).round(2)
  end
end
