Rails.application.routes.draw do

  get 'admins/index'
  get 'admins/create'
  get 'admins/new'
  get 'admins/test'
  devise_for :end_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
