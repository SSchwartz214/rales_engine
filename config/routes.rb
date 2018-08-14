Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :invoices, only: [:index]
      resources :merchants, only: [:index]
        get 'merchants/:id/revenue', to: 'merchants_revenue#revenue' 
    end
  end
end
