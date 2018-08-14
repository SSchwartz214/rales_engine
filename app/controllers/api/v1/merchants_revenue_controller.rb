class Api::V1::MerchantsRevenueController < ApplicationController

  def revenue
    @merchant = Merchant.find(params[:id])
    render json: @merchant.revenue
  end

end
