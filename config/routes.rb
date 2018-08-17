Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :merchants do
        get 'revenue', to: 'merchants_revenue#index'
        get ':id/revenue', to: 'merchants_revenue#show'
        get ':id/favorite_customer', to: 'merchants_customers#favorite'
        get 'most_items', to: 'merchants_most_items#index'
      end

      namespace :items do
        get 'most_revenue', to: 'items_revenue#most_revenue'
        get ":id/best_day", to: 'best_day#show'
        get "most_items", to: "most_items#index"
      end

      namespace :customers do
        get ':id/favorite_merchant', to: 'favorite_merchant#show'
      end

      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :invoices, only: [:index]
      resources :customers, only: [:index, :show]
    end
  end
end
