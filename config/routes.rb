Rails.application.routes.draw do
  devise_for :users
  root 'home#show'

  resources :activities
  resources :steps, except: :edit
  resource :dashboard, controller: 'dashboard'
end
