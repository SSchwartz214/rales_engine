class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def self.favorite_customer(merchant_id)
    Customer.joins(:transactions).where("transactions.result='success'").where("invoices.merchant_id=?", merchant_id).group(:id).order('count(*) desc').limit(1).first.id
  end
end
