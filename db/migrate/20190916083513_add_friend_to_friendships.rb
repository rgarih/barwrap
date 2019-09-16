class AddFriendToFriendships < ActiveRecord::Migration[5.2]
  def change
    add_reference :friendships, :friend, foreign_key: { to_table: :users}
  end
end
