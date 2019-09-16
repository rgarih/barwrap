class ChangeReferencesOnFollowings < ActiveRecord::Migration[5.2]
  def change
    remove_column :followings, :user_id
    remove_column :followings, :friend_id

  end
end
