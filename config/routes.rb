Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'static_user_pages/login'
  get 'static_user_pages/group'
  get 'static_user_pages/project'
  get 'static_user_pages/evaluation'

  root 'application#login'
end
