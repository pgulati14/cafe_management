class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.string :menu_name
      t.boolean :active
    end
  end
end
