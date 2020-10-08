Rails.application.routes.draw do
  resources :boards
  resources :tasks
  resources :etapas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
