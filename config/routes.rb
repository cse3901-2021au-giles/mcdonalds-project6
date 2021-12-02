Rails.application.routes.draw do
  get 'rails/routes'
  # main login page root
  root 'sessions#login'

  # admin sign ups
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  # create new users 
  get 'create_users', to: 'create_user#index', as: 'cusers'
  post 'create_users', to: 'create_user#new'
  delete 'create_users', to: 'create_user#destroy'

  # create new group routes
  get "new_group", to: "admin#new_group"
  post "new_group", to: "admin#create_group"

  # create new project routes
  get "new_proj", to: "admin#new_proj"
  post "new_proj", to: "admin#create_proj"



  get 'sessions/login' 
  get 'sessions/signup'
  get 'user/group'
  get 'user/proj'
  get 'user/eval'
  get 'admin/create_user'
  get 'admin/create_group'

  get 'admin/create_proj'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
