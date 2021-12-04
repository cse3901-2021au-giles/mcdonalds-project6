Rails.application.routes.draw do
  
  #project controllers
  resources :projects
  get 'assign_group', to: 'projects#assign_group'
  post 'assign_group', to: 'projects#create_proj_group'
  delete 'assign_group', to: 'projects#remove_group'
  #user controllers
  resources :users

  # group controllers
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

  get 'admin/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
