Rails.application.routes.draw do
  get 'sesstions/new'
  resources :users
  resources :posts
  root "homes#index"
  
  resources :homes 
  resources :amazon_search,only: [:index,:new]
  resources :inquiries,only: [:new,:create]
  resources :ruby,only: [:index,:show]
  post "inquiries/confirm",to: "inquiries#confirm"
  post "inquiries/back",to: "inquiries#back"
  get "amazon_search/run",to: "amazon_search#run"
  post "/callback",to: "linebot#callback"

  get "/login" ,to: "sessions#new"
  post "/login",to: "sessions#create"
  delete "/logout",to: "sessions#delete"
end
