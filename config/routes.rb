Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :invoices, only: [:index]

      resources :merchants, only: [:index, :show]
      get 'merchants/:id/revenue', to: 'merchants_revenue#show'
      get 'merchants/:id/favorite_customer', to: 'merchants_customers#favorite'

      get 'items/most_revenue', to: 'items_revenue#most_revenue'

      resources :transactions, only: [:index, :show]

      resources :customers, only: [:index, :show]

    end
  end
end
