Rails.application.routes.draw do
  resources :reports
  resources :categories
  resources :expenses, only: [:index] do
    resources :reports, only: [:index]
  end
  root 'reports#index'
  namespace :api do
    resources :expenses, only: [] do
      resources :reports, only: [:create] do
        collection do
          get 'by_day'
        end
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
