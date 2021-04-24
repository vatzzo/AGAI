Rails.application.routes.draw do
  devise_for :users
  root 'home#show'

  resources :activities do
    resources :steps
  end

  resource :dashboard, controller: 'dashboard'
end
