Rails.application.routes.draw do
  resources :instructors, only: [:index, :show, :create, :update, :destroy]
  resources :students, only: [:index, :show, :create, :update, :destroy]
end