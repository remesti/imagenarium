Rails.application.routes.draw do

  root 'dashboard#index'

  get 'dashboard' => 'dashboard#index', :as => :dashboard

  resources :topics, :cards, :schichida_sessions
  resources :user_sessions, :users

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

end
