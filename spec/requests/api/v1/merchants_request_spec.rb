require 'rails_helper'

describe 'Merchants API' do
  it 'returns a list of merchants' do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(3)
  end

  it 'returns one merchant' do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["id"]).to eq(id)
  end
end

describe 'finders' do
  it 'finds a merchant by id' do
    merchants = create_list(:merchant, 3)

      get "/api/v1/merchants/find?id=#{merchants[0].id}"

      expect(response).to be_successful

      merchants_json = JSON.parse(response.body)
      expect(merchants_json["id"]).to eq(merchants[0].id)
  end

  xit 'finds one merchant by name case insenstive' do
    merchants = create_list(:merchant, 3)

    get "/api/v1/merchants/find?name=#{merchants[0].name.upcase}"

    expect(response).to be_successful

    merchants_json = JSON.parse(response.body)

    expect(merchants_json["name"]).to eq(merchants[0].name)
  end
end
