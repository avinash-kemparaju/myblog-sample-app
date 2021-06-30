Myblog::Application.routes.draw do
  root to: 'articles#index'
  resources :users
  resources :articles
  get 'signup', to: 'users#new'
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'
  resources :categories
end
