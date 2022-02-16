Rails.application.routes.draw do
  # resources :announcements
  resources :post_attachments
  resources :achievements
  # resources :comments do
  # resources :tags, module: :comments
  # end
  
  # resources :posts do
  #   resources :comments
  # end
  resources :sports do  
    resources :posts do 
      resources :comments
    end  
    resources :players
    resources :sportannouncements  
  end  
  
  # resources :players
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
