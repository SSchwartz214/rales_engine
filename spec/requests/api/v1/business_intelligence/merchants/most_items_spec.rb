require 'rails_helper'

describe 'Merchants API' do
  it 'loads a variable number of top merchants ranked by total items sold' do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    merchant_3 = create(:merchant)
    item_1 = item(:create)
    item_2 = item(:create)
    item_3 = item(:create)

  end
end
