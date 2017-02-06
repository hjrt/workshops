Rails.application.routes.draw do

  root 'visitors#index'

  devise_for :users

  resources :teachers do
    get :subjects
  end

  resources :students do
    get :subjects
  end

  get 'report/subjects', to: 'reports#subjects'
end
