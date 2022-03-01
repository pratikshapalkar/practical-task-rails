Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"
  
  resources :post_attachments
  resources :achievements
  
  get 'sport_dataset', to: 'sports#sport_dataset'
  get 'post_dataset', to: 'posts#post_dataset'
  get 'achievement_dataset', to: 'achievements#achievement_dataset'
  resources :sports do  
    resources :posts do 
      resources :comments
    end  
    resources :players
    resources :announcements  
  end  
  
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
