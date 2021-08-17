Rails.application.routes.draw do
  devise_for :users
  root 'home#show'

  resources :activities do
    resources :steps
  end

  match '/activities/:id/grade', to: 'activities#grade', via: :post

  resource :profiles, only: :show
  resource :dashboard, controller: 'dashboard'
  resource :admin_panel, only: [:show, :destroy], controller: 'admin_panel'
  resource :comments, only: [:destroy, :create]
  resource :ratings, onlu: [:create]

  match '/admin_panel/send_email', to: 'admin_panel#send_email', via: :post
end
