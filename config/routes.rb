Rails.application.routes.draw do
  devise_for :users
  root to: "categories#index"

  resources :categories do
    resources :tasks
  end

  # get "/today", to: "tasks#due_today"
  get "tasks/task", to: "tasks#today", as: 'today'
end