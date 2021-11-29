class CreateUser < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
        t.string :name
        t.string :role
        t.string :email
        t.string :first_name
        t.string :last_name
        t.string :password_digest
        t.datetime :created_at, null: false
        t.datetime :updated_at, null: false
    end
  end
end
