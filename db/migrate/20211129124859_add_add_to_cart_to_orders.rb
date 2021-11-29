class AddAddToCartToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :add_to_cart, :boolean
    add_column :orders, :place_order, :boolean
  end
end
