Rails.application.routes.draw do
  root 'movies#index'
  get 'signin' => 'sessions#new'
  resource :session
  get 'signup' => 'users#new'
  resources :users
  resources :movies do
    resources :reviews
  end
end
