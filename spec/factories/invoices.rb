FactoryBot.define do
  factory :invoice do
    status "shipped"
    merchant {FactoryBot.create(:merchant)}
    customer {FactoryBot.create(:customer)}
  end
end
