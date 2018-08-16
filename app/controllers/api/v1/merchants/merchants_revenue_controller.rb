class Api::V1::Merchants::MerchantsRevenueController < ApplicationController

  def show
    if params['date']
      render json: Merchant.find(params[:id]).total_revenue_by_date(params['date']), serializer: MerchantRevenueSerializer
    else
      render json: Merchant.find(params[:id]).total_revenue, serializer: MerchantRevenueSerializer
    end
  end

  def index
    render json: Merchant.total_revenue_by_date(params['date']), serializer: MerchantRevenueSerializer
  end
end
