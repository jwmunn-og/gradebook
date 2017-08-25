Rails.application.routes.draw do
  devise_for :users
  root "static_pages#index"
  resource :dashboard, only: [:show]
  resources :courses, only: [:index, :show] do
    resources :enrollments
  end
  resources :courses, only: [:index, :show]
  namespace :teacher do
    resources :courses
  end
end
