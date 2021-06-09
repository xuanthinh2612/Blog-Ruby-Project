Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles
  resources :pages do
    collection do
      get :about
    end
  end
  root 'pages#home'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
end
