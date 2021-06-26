Rails.application.routes.draw do
  devise_for :users
  root 'home#show'

  resources :activities do
    resources :steps
  end

  match '/activities/:id/grade', to: 'activities#grade', via: :post

  resource :dashboard, controller: 'dashboard'
  resource :admin_panel, only: [:show, :destroy], controller: 'admin_panel'
end
