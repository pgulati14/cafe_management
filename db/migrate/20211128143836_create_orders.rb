class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :user_id
      t.datetime :delivered_at
      t.float :total_price
      t.string :status
      t.datetime :ordered_at
    end
  end
end
