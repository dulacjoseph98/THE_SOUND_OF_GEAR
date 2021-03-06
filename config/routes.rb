Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :devices, only: [:index, :show, :new, :create, :destroy] do 
   resources :reservations, only: [:show, :create]
  end
  resources :reservations, only: [:index]
end
