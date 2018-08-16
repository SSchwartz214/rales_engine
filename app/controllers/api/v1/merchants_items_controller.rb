class Api::V1::MerchantsItemsController < ApplicationController

  def index
    render json: Merchant.most_items(params[:quantity])
  end
end
