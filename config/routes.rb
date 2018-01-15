Rails.application.routes.draw do
  devise_for :users

  resources :projects
  resources :entries
  
  match '/contacts',     to: 'contacts#new',  via: 'get'  
  resources :contacts, only: [:new, :create]

  get 'home/index'
  root 'home#index'

  # Prevents error page and redirects user to home
  get '*path' => redirect('/')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
