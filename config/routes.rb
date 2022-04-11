Rails.application.routes.draw do
  root "homes#index"
  
  resources :homes 
  resources :amazon_search,only: [:index,:new]
  resources :inquiries,only: [:new,:create]
  resources :ruby,only: [:index,:show]
  post "inquiries/confirm",to: "inquiries#confirm"
  post "inquiries/back",to: "inquiries#back"
  get "amazon_search/run",to: "amazon_search#run"
end
