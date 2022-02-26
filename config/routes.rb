Rails.application.routes.draw do
  root "homes#index"
  
  resources :homes 
  resources :inquiries,only: [:new,:create]
  post "inquiries/confirm",to: "inquiries#confirm"
  post "inquiries/back",to: "inquiries#back"
 
end
