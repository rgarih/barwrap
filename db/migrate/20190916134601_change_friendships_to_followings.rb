class ChangeFriendshipsToFollowings < ActiveRecord::Migration[5.2]
  def change
    rename_table :friendships, :followings
  end
end
