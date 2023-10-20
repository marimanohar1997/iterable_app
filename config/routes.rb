Rails.application.routes.draw do
  
  devise_for :users
  get 'pages/index'
  get 'create_event_a', to: 'events#create_event_a'
  get 'create_event_b', to: 'events#create_event_b'
  root 'pages#index'

end 
