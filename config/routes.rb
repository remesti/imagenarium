Rails.application.routes.draw do

  get 'card_session/show'

  resources :cards, only: %i(new create edit update)
  
end
