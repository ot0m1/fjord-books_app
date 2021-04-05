Rails.application.routes.draw do
  get 'users/index'
  get 'users/show/:id', to: 'users#show', as: 'show'
  devise_for :users, :controllers => { :registrations => 'users/registrations', :sessions => 'users/sessions', :passwords => 'users/passwords' }
  resources :books
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
