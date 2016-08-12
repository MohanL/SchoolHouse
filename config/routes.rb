Rails.application.routes.draw do

  resources :attendances

  root 'static_pages#welcome'
  get 'static_pages/about'
  get 'static_pages/contact'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :student_classes, path: :classes do
    resources :students, only: [:show, :index]
  end

  resources :users do
    resources :students, only: [:show, :index]
  end

  resources :students
  resources :supplies

end
