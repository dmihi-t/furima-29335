Rails.application.routes.draw do
  get 'items/index'
  resources :products, only: :index  


end
