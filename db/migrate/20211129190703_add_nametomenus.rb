class AddNametomenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :name, :string
  end
end
