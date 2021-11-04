Rails.application.routes.draw do
  root 'home#index'
  resources :streams

  namespace :charts do
    get "completed_tasks"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
