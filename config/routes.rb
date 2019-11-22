Rails.application.routes.draw do

  root "products#index"

  # admin

    # adminコントローラ
      get 'admin' =>'admins#index'

    # admin_endusersコントローラ
      get "admins/users" => "admin_endusers#index"
      get "admins/users/:id" => "admin_endusers#show", as: "admins_user"
      get "admins/users/:id/edit" => "admin_endusers#edit", as: "admins_users_edit"
      post "admins/users/:id" => "admin_endusers#create"
      delete "admins/users/:id" => "admin_endusers#destroy"

    # admin_productsコントローラ
      get "admins/products/new" => "admin_products#new"
      get "admins/products" => "admin_products#index"
      get "admins/products/:id" => "admin_products#show", as: "admins_product"
      post "admins/products" => "admin_products#create"
      get "admins/products/:id/edit" => "admin_products#edit", as: "admins_products_edit"
      patch "admins/products/:id" => "admin_products#update",as: "admins_products_update"
      put "admins/products/:id" => "admin_products#update"
      delete "admins/products/:id" => "admin_products#destroy"

    # admin_inquiriesコントローラ
      get "admins/inquiries" => "admin_inquiries#index"
      get "admins/inquiries/:id" => "admin_inquiries#show", as: "admins_inquiry"
      # post "admins/inquiries/:id" => "admin_inquiries#create"
      patch "admins/inquiries/:id" => "admin_inquiries#create"

    # admin_reviewsコントローラ
      get "admins/reviews/:id/edit" => "admin_reviews#edit", as: "admins_review_edit"
      patch "admins/reviews/:id" => "admin_reviews#update", as: "admins_review_update"
      put "admins/reviews/:id" => "admin_reviews#update"
      delete "admins/reviews/:id" => "admin_reviews#destroy", as: "admins_review_destroy"

    # admin_order_historiesコントローラ
      get "admins/order_histories" => "admin_order_histories#index"
      get "admins/order_histories/:id" => "admin_order_histories#show", as: "admins_order_history"
      patch "admins/order_histories/:id" => "admin_order_histories#update", as: "admins_order_history_update"
      put "admins/order_histories/:id" => "admin_order_histories#update"

    # admin_arrival_recordsコントローラ
      get "admins/arrival_records" => "admin_arrival_records#index"
      get "admins/:id/arrival_records/new" => "admin_arrival_records#new", as: "admins_arrival_records_new"
      post "admins/:id/arrival_records" => "admin_arrival_records#create", as: "admins_arrival_records_create"

    # admin devise
      devise_for :admins, controllers: {
      sessions:      'admins/sessions',
      passwords:     'admins/passwords',
      registrations: 'admins/registrations'
    }


  # end_users

    # usersコントローラ
      get "users/close" => "users#complete"
      get "users/:id" => "users#show", as: "user"
      get "users/:id/edit" => "users#edit",as: "users_edit"
      get "users/:id/close" => "users#close",as: "user_close"
      patch "users/:id" => "users#update"
      put "users/:id" => "users#update"
      delete "users/:id" => "users#destroy",as: "destroy_user"

    # user_reviewsコントローラ
      get "product/:id/user_reviews" => "user_reviews#index", as: "product_reviews"
      post "products/:id" => "user_reviews#create"

    # productsコントローラ
      get "products/search" => "products#search"
      resources :products, only:[:show]


    # user_inquiriesコントローラ
      get "user/:id/inquiries/complete" => "user_inquiries#complete", as: "user_inquiries_complete"
      get "user/:id/inquiries/new" => "user_inquiries#new", as: "new_user_inquiry"
      post "user/:id/inquiries" => "user_inquiries#create", as: "user_inquiries"

    # user_cartsコントローラ

      get "carts" => "user_carts#index", as: "user_carts"
      patch "carts/:id" => "user_carts#update",as: "user_carts_update"
      put "carts/:id" => "user_carts#update"
      delete "carts/:id" => "user_carts#destroy",as: "user_carts_delete"

    # user_purchasesコントローラ
      get "users/:id/purchase/new" => "user_purchases#new", as: "user_purchases_new"
      post "users/:id/purchase" => "user_purchases#create", as: "user_purchases_create"
      get "users/purchase/complete" => "user_purchases#complete"

    # user_addressesコントローラ
      get "users/:id/user_addresses" => "user_addresses#show", as: "user_address"
      get "users/:id/user_addresses/new" => "user_addresses#new", as: "user_addresses_new"
      post "users/:id/user_addresses/new" => "user_addresses#create"
      get "users/:id/user_addresses/edit" => "user_addresses#edit", as: "user_addresses_edit"
      patch "users/:id/user_addresses" => "user_addresses#update", as: "user_addresses_update"
      put "users/:id/user_addresses" => "user_addresses#update"
      delete "users/:id/user_addresses" => "user_addresses#destroy"

    # user_order_historiesコントローラ
      get "users/user_order_histories/:id" => "user_order_histories#show", as: "user_order_history"


    # user_favoritesコントローラ
      post "users/:id/favorites" => "user_favorites#create", as: "user_favorites_create"
      delete "users/:id/favorites" => "user_favorites#destroy", as: "user_favorites_destroy"

    #end_user devise
      devise_for :end_users, controllers: {
      sessions:      'users/sessions',
      passwords:     'users/passwords',
      registrations: 'users/registrations'
    }




end
