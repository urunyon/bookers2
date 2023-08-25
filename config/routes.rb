Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  get 'homes/about', as: 'about'
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy]
  resources :users, only: [:new, :rcrete, :index, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
