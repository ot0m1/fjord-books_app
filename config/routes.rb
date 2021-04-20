Rails.application.routes.draw do
  get 'users/index'
  get 'users/show/:id', to: 'users#show'
  devise_for :users, :controllers => { :registrations => 'users/registrations', :sessions => 'users/sessions', :passwords => 'users/passwords' }
  resources :books
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
