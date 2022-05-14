Rails.application.routes.draw do
  root 'static_page#home'
  resources :static_page
  devise_for :admins
  resources :articles, only: [:index, :show]
end
