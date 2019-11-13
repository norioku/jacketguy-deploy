Rails.application.routes.draw do



  get 'admins/index'
  get 'admins/create'
  get 'admins/new'

  # get 'users/:id' => 'users#index', as: "users"
  get 'users/:id' => 'users#show', as: "user"
  devise_for :end_users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
