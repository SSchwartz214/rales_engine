class Api::V1::MerchantsCustomersController < ApplicationController
  def favorite
    render json: {id: Customer.favorite_customer(params[:id].to_i)}
  end
end
