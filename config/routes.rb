Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/", to: "home#index"
  # get "menus", to: "menus#index"
  resources :menus
  resources :menu_items
  resources :users
  resources :orders
  resources :order_items
  post "/signin" => "sessions#create", as: :sessions
  get "/signin" => "sessions#new", as: :new_sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
  get "/cart" => "orders#show_cart", as: :cart_orders
  get "/active" => "menus#active_menus", as: :active_menus
end
