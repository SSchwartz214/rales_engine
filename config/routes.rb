Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :merchants do
        get 'revenue', to: 'merchants_revenue#index'
        get ':id/revenue', to: 'merchants_revenue#show'
        get ':id/favorite_customer', to: 'merchants_customers#favorite'
        get ':id/customers_with_pending_invoices', to: 'merchant_pending_invoices#index'
        get 'most_items', to: 'merchants_most_items#index'
        get 'most_revenue', to: 'most_revenue#index'
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get 'random', to: 'random#show'
        get ':id/items', to: 'items#index'
        get ':id/invoices', to: 'invoices#index'
      end

      namespace :items do
        get 'most_revenue', to: 'items_revenue#most_revenue'
        get ":id/best_day", to: 'best_day#show'
        get "most_items", to: "most_items#index"
        get ":id/invoice_items", to: "invoice_items#index"
        get ":id/merchant", to: "merchant#show"
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
      end

      namespace :customers do
        get ':id/favorite_merchant', to: 'favorite_merchant#show'
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get 'random', to: 'random#show'
        get ':id/invoices', to: 'invoices#index'
        get ':id/transactions', to: 'transactions#index'
      end

      namespace :transactions do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get 'random', to: 'random#show'
        get ':id/invoice', to: 'invoice#show'
      end

      namespace :invoices do
        get ':id/transactions', to: 'transactions#index'
        get ':id/invoice_items', to: 'invoice_items#index'
        get ':id/items', to: 'items#index'
        get ':id/customer', to: 'customer#show'
        get ':id/merchant', to: 'merchant#show'
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'

      end

      namespace :invoice_items do
        get ':id/invoice', to: 'invoice#show'
        get ':id/item', to: 'item#show'
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
      end

      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end
end
