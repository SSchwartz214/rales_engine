class Api::V1::Merchants::MerchantPendingInvoicesController < ApplicationController
  def index
    render json: Customer.pending_invoices
  end
end
