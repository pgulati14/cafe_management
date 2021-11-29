Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/", to: "home#index"
  # get "menus", to: "menus#index"
  resources :menus
  resources :menu_items
  resources :users
  resources :orders
  resources :order_items
  resources :admin
  post "/signin" => "sessions#create", as: :sessions
  get "/signin" => "sessions#new", as: :new_sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
  get "/cart" => "orders#show_cart", as: :cart_orders
  get "/active" => "menus#active_menus", as: :active_menus

  put "menus/edit_menu_details" => "menus#edit_menu_details", as: :edit_menu_details
  put "menu_item/edit_menu_items_details" => "menu_items#edit_menu_item_details", as: :edit_menu_item_details
  get "admin/manage_billers" => "admin#manage_billers", as: :manage_billers
  get "admin/new_clerk" => "admin#new_clerk", as: :new_clerk
  post "admin/create_clerk" => "admin#create_clerk", as: :create_clerk
  get "admin/users" => "admin#users", as: :show_users
  get "admin/reports" => "admin#reports", as: :show_reports
  delete "admin/delete_user" => "admin#delete_user", as: :delete_user
  patch "admin/role_clerk" => "admin#role_change_clerk", as: :role_change_clerk
  patch "admin/role_customer" => "admin#role_change_customer", as: :role_change_customer
  get "/orders/pending" => "orders#pending", as: :pending_orders
end
