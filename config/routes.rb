Rails.application.routes.draw do
 
 
 

  

 
  resources :rols
  resources :contacts
  resources :hpcs
  resources :agreements
  get 'tool_tests/index'

  get 'tool_tests/show'

  get 'tool_tests/new'

  get 'tool_tests/edit'

  post "create_hpc", to: "patients#create_hpc" , as: "create_hpc"
  post "create_agreement", to: "patients#create_agreement" , as: "create_agreement"
  


  get "citas", to: "appointments#citas", as: "citas"
  get "citas_admin", to: "appointments#citas_admin", as: "citas_admin"
  get "appointments/get_appointments", to: "appointments#get_appointments"
  get "appointments/get_appointments_admin", to: "appointments#get_appointments_admin"
  get "all_patients", to: "patients#all_patients", as: "all_patients"
  resources :patients do 
     resources :appointments 
     
     resources :clinic_histories do 
        resources :personal_histories
        resources :two_child_histories
        resources :child_general_dates
        resources :three_child_histories
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
     get 'consentimiento_informado_menores', to: "patients#consentimiento_informado_menores", as: "consentimiento_informado_menores"
     get 'consentimiento_informado_adolescentes', to: "patients#consentimiento_informado_adolescentes", as: "consentimiento_informado_adolescentes"
     get 'consentimiento_informado', to: "patients#consentimiento_informado", as: "consentimiento_informado"
  

  end
  resources :accounts

  root 'home#index'

  #User
  devise_for :users,
:controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  devise_scope :user do 
    get "users/index", to: "users/views#index", as: "users_index"
    get '/users/new', to: 'users/views#new_user', as: "new_user"
    post "create_user", to: "users/views#create_user", as: "create_user"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
