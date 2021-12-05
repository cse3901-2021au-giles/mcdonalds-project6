Rails.application.routes.draw do
  
  resources :projects
  resources :users
  resources :groups
  get 'add_to_group', to: 'groups#add_user' 
  post 'add_to_group', to: 'groups#create_grouping'
  delete 'add_to_group', to: 'groups#remove_user'
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

  

  # create new group routes
  get "new_group", to: "admin#new_group"
  post "new_group", to: "admin#create_group"
 

  # create new project routes
  get "new_proj", to: "admin#new_proj"
  post "new_proj", to: "admin#create_proj"

  get 'admin/create_group'

  get 'admin/create_proj'
  get 'admin/index'

  #User homepage
  get 'user_home', to: "users#home"

  get 'user_groups', to: "groups#user_groups"

  get 'show_group', to: "groups#show_user_groups"

  get 'show_user_projects', to: "projects#show_user_projects"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
