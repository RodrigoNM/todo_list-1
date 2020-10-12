Rails.application.routes.draw do
  
  resources :boards do
    resources :tasks do
      member do
        patch :complete
      end
    end
  end
    resources :etapas


  root "boards#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
