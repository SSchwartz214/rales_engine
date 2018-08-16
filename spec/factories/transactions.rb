FactoryBot.define do
  factory :transaction do
    invoice
    credit_card_number 234324243
    credit_card_expiration_date "02/2020"
    result { ["Success", "Failed"].sample }
  end
end
