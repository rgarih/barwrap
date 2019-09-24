class AddIndexToFollowings < ActiveRecord::Migration[5.2]
  def change
     add_index :followings, [:following_id, :follower_id], unique: true
  end
end
