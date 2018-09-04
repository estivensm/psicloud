Rails.application.routes.draw do
 
 
  resources :field_defaults
  resources :consents
  resources :fields
  get 'loaderio-a37049370b15266d36ffe4514aeca803.txt', to: "home#loader"
  get 'stats/index', as: "stats"
  get 'general_stats', to: 'stats#general_stats' , as: 'general_stats'
  
  get 'general_files/:id', to: 'tool_tests#general_files' , as: 'general_files'

  get 'patients/change_state/:value/:id', to: "patients#change_state", as: "change_state"
  resources :account_types
  resources :documents
  resources :rols
  resources :contacts
  resources :hpcs
  resources :agreements
  
  post "buscador/:search1", to: "appointments#index", as: "buscador"

  get 'patients/csv'
  get 'patients/csv_all'

  post 'cambiar/:id/:estado', to: 'appointments#state', as: 'cambiar' 


  #actualizar datos por ajax cuando escribe
  post "actualizar_hc", to: "clinic_histories#actualizar_hc"

  post "crear_firma_paciente" , to: "patients#crear_firma_paciente" , as: "crear_firma_paciente"
  post "crear_firma_padre" , to: "patients#crear_firma_padre" , as: "crear_firma_padre"
  post "crear_firma_madre" , to: "patients#crear_firma_madre" , as: "crear_firma_madre"
  post "create_hpc", to: "patients#create_hpc" , as: "create_hpc"
  post "create_agreement", to: "patients#create_agreement" , as: "create_agreement"

  post "change_fcitas", to: "clinic_histories#change_fcitas" , as: "change_fcitas"
  
  post "send_history", to: "patients#send_history", as: "send_history"


  post "edit_calendar", to: "appointments#edit_calendar", as: "edit_calendar"
  get "new_calendar/:start_datetime", to: "appointments#new_calendar", as: "new_calendar"
  post "create_calendar", to: "appointments#create_calendar", as: "create_calendar"

  get "citas", to: "appointments#citas", as: "citas"
  get "citas_historico", to: "appointments#citas_historico", as: "citas_historico"

  get "citas_calendar", to: "appointments#citas_calendar", as: "citas_calendar"
  get "citas_calendar_admin", to: "appointments#citas_calendar_admin", as: "citas_calendar_admin"
  
  get "citas_pdf/:patient/:fecha/:tipo", to: "appointments#citas_pdf", as: "citas_pdf"
  get "citas_admin", to: "appointments#citas_admin", as: "citas_admin"
  get "appointments/get_appointments", to: "appointments#get_appointments"
  get "appointments/get_appointments_admin", to: "appointments#get_appointments_admin"
  get "patients/change_state_appointment/:id/:state", to: "appointments#change_state_appointment" , as: "change_state_appointment"

  get 'cambiar_state/:estado/:id/:field', to: 'field_defaults#cambiar_state', as: 'cambiar_state' 

  get "all_patients", to: "patients#all_patients", as: "all_patients"
  resources :patients do 
    resources :tasks
    
     resources :appointments 
     
     resources :clinic_histories do 
        resources :personal_histories
        resources :two_child_histories
        resources :child_general_dates
        resources :three_child_histories
        resources :tracings
        resources :tool_tests

        
        get "pdf_completo", to: "clinic_histories#pdf_completo", as: "pdf_completo"
        get "backgrounds", to: "backgrounds#index", as: "backgrounds" 
        get "backgrounds/new", to: "backgrounds#new", as: "new_backgrounds" 
        post "backgrounds/create", to: "backgrounds#create", as: "create_background" 
        get "backgrounds/edit/:id", to: "backgrounds#edit", as: "edit_backgrounds" 
        patch "backgrounds/update", to: "backgrounds#update", as: "update_backgrounds" 
        delete "backgrounds/destroy/:id", to: "backgrounds#destroy", as: "destroy_backgrounds"


        get "backgrounds/new_background_personal", to: "backgrounds#new_background_personal", as: "new_background_personal" 
        post "backgrounds/create_background_personal", to: "backgrounds#create_background_personal", as: "create_background_personal" 
        get "backgrounds/edit_background_personal/:id", to: "backgrounds#edit_background_personal", as: "edit_background_personal" 
        patch "backgrounds/update_background_personal", to: "backgrounds#update_background_personal", as: "update_background_personal" 
        delete "backgrounds/destroy_background_personal/:id", to: "backgrounds#destroy_background_personal", as: "destroy_background_personal"

        
     
     
     end
     
     patch "update_step3/:id", to: "clinic_histories#update_step3", as: "update_step3"
     get "step3/:id", to: "clinic_histories#step3", as: "step3"
     get 'consentimiento_informado_menores', to: "patients#consentimiento_informado_menores", as: "consentimiento_informado_menores"
     get 'consentimiento_informado_adolescentes', to: "patients#consentimiento_informado_adolescentes", as: "consentimiento_informado_adolescentes"
     get 'consentimiento_informado', to: "patients#consentimiento_informado", as: "consentimiento_informado"
     get 'consentimiento_creado', to: "patients#consentimiento_creado", as: "consentimiento_creado"
  

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
    get '/users/:id/edit', to: 'users/views#edit_user', as: "edit_user"
    post "/users/update_user/edit", to: "users/views#update_user", as: "update_user"
    delete "delete_user/:id", to: "users/views#delete_user", as: "delete_user"
    get '/users/:id', to: 'users/views#show_user', as: "show_user"
    get '/users/firma_psicologo/:id', to: 'users/views#firma_psicologo', as: "firma_psicologo"
    post "/users/crear_firma_psicologo" , to: "users/views#crear_firma_psicologo" , as: "crear_firma_psicologo"

  end


resources :diagnosticos do
  collection { post :import }

end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
