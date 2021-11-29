class AddMenuIdtomenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :menu_id, :string
  end
end
