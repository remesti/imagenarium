Rails.application.routes.draw do

  resources :topics, :cards, :schichida_sessions, :card_sessions

end
