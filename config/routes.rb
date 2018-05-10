Rails.application.routes.draw do

  get 'home/index'
  root 'home#index'
  
  get 'about/index'

  devise_for :users

  resources :projects
  resources :entries

  # Prevents error page and redirects user to home
  get '*path' => redirect('/')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
