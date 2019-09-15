class AddFirstNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :location, :string
    add_column :users, :gender, :string
    add_column :users, :age, :integer
    add_column :users, :username, :string
    add_column :users, :bio, :text
    add_column :users, :photo, :string
  end
end
