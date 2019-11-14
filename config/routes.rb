Rails.application.routes.draw do


  # get 'admins/:id' => 'admins#index', as: 'admin'
  get 'admins/create'
  get 'admins/new'
  get 'admins/index' =>'admins#index'
  get 'users/:id' => "users#show", as: 'user'

  devise_for :end_users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'users/registrations'
  # registrations: 'admins/registrations'
}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
