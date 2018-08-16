class MerchantRevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    ((object.total_revenue.to_f) / 100.round(2)).to_json
  end

end
