Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
    # auth_:provider_callback: 'users/omniauth_callbacks'
    # :provider_callback: 'users/omniauth_callbacks'
  }
  # get '/auth/:provider/callback' => 'users/omniauth_callbacks#github'
  get '/auth/:provider/callback' => 'root'
  resources :books
  resources :users, only: %i(index show)
  # resources :users
end
