Rails.application.routes.draw do
  root 'home#show'

  resources :activities, except: :edit
end
