Rails.application.routes.draw do
  devise_for :users
  root 'home#show'

  resources :activities, except: :edit
  resources :steps, except: :edit
end
