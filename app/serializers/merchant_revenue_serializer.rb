class MerchantRevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    ((object.to_f) / 100.round(2)).to_json
  end

end
