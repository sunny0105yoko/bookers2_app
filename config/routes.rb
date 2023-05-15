Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'books/edit'
  get 'homes/top
  resources :books, only: [:new, :create, :index, :show, :destroy]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
end
