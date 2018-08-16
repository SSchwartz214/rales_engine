class Item < ApplicationRecord
  validates_presence_of :name, :description, :unit_price

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.most_revenue(quantity)
    Item.joins(:invoice_items).group(:id).select('sum(invoice_items.unit_price * invoice_items.quantity) AS total_revenue', :id, :name).order('total_revenue desc').limit(quantity)
  end
end
