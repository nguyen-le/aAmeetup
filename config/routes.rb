Rails.application.routes.draw do
  root 'sessions#new'

  get '/home', to: 'users#home'
  resources :events do
    resources :rsvps, only: [:create, :index]
  end
  resources :chats
  resources :users
  resources :features do
    resources :votes, only: [:create]
  end
  resource  :session, only: [:new, :create, :destroy]
end
