Rails.application.routes.draw do
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "new_users", to: "admin#create_user"
  post "new_users", to: "admin#create_user"
  get "new_groups", to: "admin_controller#new"
  post "new_groups", to: "admin_controller#create"
  get "create_proj", to: "admin_controller#new"
  post "create_proj", to: "admin_controller#create"


  get 'sessions/login' 
  get 'sessions/signup'
  get 'user/group'
  get 'user/proj'
  get 'user/eval'
  get 'admin/create_user'
  get 'admin/create_group'

  get 'admin/create_proj'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'static_user_pages#login'
  get 'static_user_pages/group'
  get 'static_user_pages/project'
  get 'static_user_pages/evaluation'

  get 'static_admin_pages/evaluation'
  get 'static_admin_pages/group'
  get 'static_admin_pages/login'
  get 'static_admin_pages/members'
  get 'static_admin_pages/project'
  get 'static_admin_pages/student'

  resources :users, only: [:new, :create, :index, :show]
end
