Rails.application.routes.draw do
  namespace :api do
    namespace :partners do
      resources :discounts, only: [:index]
    end
  end
end
