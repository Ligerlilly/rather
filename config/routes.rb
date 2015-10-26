Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :answers
  
  resources :questions do
    resources :answers
  end
end
