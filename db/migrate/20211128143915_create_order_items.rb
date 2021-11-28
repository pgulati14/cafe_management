class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.string :order_id
      t.string :menu_item_id
      t.string :menu_item_name
      t.float :menu_item_price
      t.float :price
      t.integer :quantity
    end
  end
end
