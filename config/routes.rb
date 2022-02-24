Rails.application.routes.draw do
  root "homes#index"
  get "homes/contents" => "homes#contents"
  resources :homes 
 
 
end
