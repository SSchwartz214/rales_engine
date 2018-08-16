class Api::V1::MerchantsRevenueController < ApplicationController

  def show
    if params['date']
      render json: Merchant.find(params[:id]).total_revenue_by_date(params['date'])
    else
      render json: Merchant.find(params[:id]), serializer: MerchantRevenueSerializer
    end
  end

  def index
    render json: Merchant.total_revenue_by_date(params['date'])
  end
end
