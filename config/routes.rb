Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => 'homes#about',as:'about'
  #get 'users/show' => 'users#show' ,as:'user_show'
  #get 'users/edit'
  #get 'books/edit'
  #get 'homes/top
  post 'books' => 'books#create'
  patch'books/:id' =>'books#update',as:'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  get 'books/:id/edit' => 'books#edit',as:'edit_book'
  resources :books, only: [:new, :create, :index, :show]
  resources :users, only: [:show, :edit, :update, :index]
end