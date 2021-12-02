Rails.application.routes.draw do
  get 'rails/routes'
  # main login page root
  # root 'sessions#login'

 # admin routes
 # admin_home 
  get "admin_home", to: "admin#index"
  get "group_home", to: "admin#index_group"
  get "project_home", to: "admin#index_project"
  delete 'group_home', to: 'admin#destroy'

   # admin sign ups/logins/ logouts
  root 'registrations#new'
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  delete 'logout', to: "sessions#destroy"
  
  # admin sign ins
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  # create new users 
  delete 'create_users', to: 'create_user#destroy'
  get 'create_users', to: 'create_user#index', as: 'cusers'
  post 'create_users', to: 'create_user#new'
  patch 'create_users', to: 'create_user#update'
 

  # create new group routes
  get "new_group", to: "admin#new_group"
  post "new_group", to: "admin#create_group"
 

  # create new project routes
  get "new_proj", to: "admin#new_proj"
  post "new_proj", to: "admin#create_proj"

  # user routes
  get 'user_groups', to: 'user#group'
  get 'user/proj'
  get 'user/eval'
  get 'admin/create_user'
  get 'admin/create_group'

  get 'admin/create_proj'
  get 'admin/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
