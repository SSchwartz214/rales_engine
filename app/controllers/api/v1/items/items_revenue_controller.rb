class Api::V1::Items::ItemsRevenueController < ApplicationController
  def most_revenue
    render json: Item.most_revenue(params["quantity"].to_i)
  end
end
