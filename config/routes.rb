Rails.application.routes.draw do
 
 
 

  
  get 'tool_tests/index'

  get 'tool_tests/show'

  get 'tool_tests/new'

  get 'tool_tests/edit'

  resources :patients do 
     resources :clinic_histories do 
        
      resources :tracings
        
        get "backgrounds", to: "backgrounds#index", as: "backgrounds" 
        get "backgrounds/:clase/new", to: "backgrounds#new", as: "new_backgrounds" 
        post "backgrounds/create", to: "backgrounds#create", as: "create_background" 
        get "backgrounds/edit/:id", to: "backgrounds#edit", as: "edit_backgrounds" 
        patch "backgrounds/update", to: "backgrounds#update", as: "update_backgrounds" 
        delete "backgrounds/destroy/:id", to: "backgrounds#destroy", as: "destroy_backgrounds"

        

        get "tool_tests", to: "tool_tests#index", as: "tool_tests" 
        get "tool_tests/new", to: "tool_tests#new", as: "new_tool_tests" 
        post "tool_tests/create", to: "tool_tests#create", as: "create_tool_test" 
        get "tool_tests/edit/:id", to: "tool_tests#edit", as: "edit_tool_test" 
        patch "tool_tests/update", to: "tool_tests#update", as: "update_tool_test" 
        delete "tool_tests/destroy/:id", to: "tool_tests#destroy", as: "destroy_tool_test"

     
     
     end
     
     patch "update_step3/:id", to: "clinic_histories#update_step3", as: "update_step3"
     get "step3/:id", to: "clinic_histories#step3", as: "step3"

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
