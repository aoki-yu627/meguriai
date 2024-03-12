Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'sweets/spring' => 'sweets#spring'
  get 'sweets/summer' => 'sweets#summer'
  get 'sweets/autumn' => 'sweets#autumn'
  get 'sweets/winter' => 'sweets#winter'

  get 'sweets/search' => 'sweets#search' 

  get 'sweets/itiran' => 'sweets#itiran' 

  resources :sweets do
    resources :comments, only: [:create]
  end
  
    root 'sweets#index'
  
 
end
