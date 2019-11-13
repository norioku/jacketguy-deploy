Rails.application.routes.draw do
<<<<<<< HEAD
  get 'admins/index'
  get 'admins/create'
  get 'admins/new'
=======
  devise_for :end_users
>>>>>>> 19b62b25f28a88639a847c81bbe3c973cce20f51
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
