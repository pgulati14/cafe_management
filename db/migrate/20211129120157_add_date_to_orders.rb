class AddDateToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :date, :datetime
  end
end
