Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => 'homes#about',as:'about'
  #get 'users/show' => 'users#show' ,as:'user_show'
  #get 'users/edit'
  #get 'books/edit'
  #get 'homes/top
  resources :books, only: [:new, :create, :index, :show, :edit]
  resources :users, only: [:show, :edit, :update]
end