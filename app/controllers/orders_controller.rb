class OrdersController < ApplicationController
  def create
    item_ids = params[:item_ids]
    clean_item_ids = item_ids - [nil]
    new_order = Order.create!(
      user_id: current_user.id,
      date: DateTime.now,
    )
    id = new_order.id
    clean_item_ids.each { |menu_item_id|
      OrderItem.create!(order_id: id,
                        menu_item_id: menu_item_id,
                        menu_item_name: MenuItem.find(menu_item_id).menu_item_name,
                        menu_item_price: MenuItem.find(menu_item_id).menu_item_price)
    }
    redirect_to menus_path
  end
end
