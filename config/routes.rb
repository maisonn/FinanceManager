Rails.application.routes.draw do
  resources :incomes
  resources :reports
  resources :categories
  resources :expenses
  root 'reports#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
