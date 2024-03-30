Rails.application.routes.draw do
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root 'sweets#index'
  get 'sweets/spring' => 'sweets#spring'
  get 'sweets/summer' => 'sweets#summer'
  get 'sweets/autumn' => 'sweets#autumn'
  get 'sweets/winter' => 'sweets#winter'

  get 'sweets/search' => 'sweets#search' 
  get 'search', to: 'sweets#index', as: 'search_sweets'
  get 'sweets/itiran' => 'sweets#itiran' 

  
  

  resources :sweets do
    resources :comments, only: [:create]
  end
  
 
 
end
