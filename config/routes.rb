Rails.application.routes.draw do
 
 
  resources :patients do 
     resources :clinic_histories

  end
  resources :accounts
  root 'home#index'

  #User
  devise_for :users
  devise_scope :user do 
    get "users/index", to: "users/views#index", as: "users_index"
    get '/users/new', to: 'users/views#new_user', as: "new_user"
    post "create_user", to: "users/views#create_user", as: "create_user"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
