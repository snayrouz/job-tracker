Rails.application.routes.draw do
  root to: 'index#index'

  resources :companies do
    resources :jobs
    resources :contacts, only: [:create]
  end

  resources :jobs do
    resources :comments
  end

  resources :categories

  get '/dashboard', to: 'dashboard#index'

end
