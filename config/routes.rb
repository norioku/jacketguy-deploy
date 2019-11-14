Rails.application.routes.draw do



  get 'admin/:id' =>'admins#index', as: 'admins'
  get 'users/:id' => "users#show", as: 'user'


  get 'admins/index'
  get 'admins/create'
  get 'admins/new'

  devise_for :end_users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  # registrations: 'admins/registrations'
}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
