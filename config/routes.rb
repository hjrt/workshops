Rails.application.routes.draw do

  root 'visitors#index'

  devise_for :users

  resources :teachers

  resources :students do
    get :subjects
  end

  get 'report/subjects', to: 'reports#subjects'
end
