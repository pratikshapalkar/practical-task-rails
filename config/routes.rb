Rails.application.routes.draw do
 
  resources :post_attachments
  resources :achievements
  resources :posts do
    resources :tags, module: :posts
end
resources :comments do
    resources :tags, module: :comments
end
  resources :sports
  resources :players
  root 'pages#home'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }
  get '/confirmation_pending' => 'pages#after_registration_path'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
