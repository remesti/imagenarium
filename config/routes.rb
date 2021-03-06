Rails.application.routes.draw do

  root 'topics#index'

  resources :topics, :cards, :schichida_sessions, :doman_sessions, :math_sessions
  resources :user_sessions, :users

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

end
