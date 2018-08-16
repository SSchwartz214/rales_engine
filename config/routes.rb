Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :invoices, only: [:index]
      resources :merchants, only: [:index]
      get 'merchants/:id/revenue', to: 'merchants_revenue#revenue'
      get 'merchants/:id/favorite_customer', to: 'merchants_customers#favorite'
      get 'items/most_revenue', to: 'items_revenue#most_revenue'
    end
  end
end
