Rails.application.routes.draw do
  resources :boards
  resources :boards do
    resources :tasks do
      resources :cards
    end
  end


  root "boards#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
