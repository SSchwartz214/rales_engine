class Api::V1::ItemsRevenueController < ApplicationController
  def most_revenue
    render json: Item.most_revenue(params["quantity"].to_i)
  end
end
