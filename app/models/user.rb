class User < ApplicationRecord
  has_many :favorite_places
  has_many :check_ins


  mount_uploader :photo, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :followings

  has_many :follower_relationships, foreign_key: :following_id, class_name: "Following"
  has_many :followers, through: :follower_relationships, source: :follower


  has_many :following_relationships, source: :followings, foreign_key: :follower_id, class_name: "Following"
  has_many :followings, through: :following_relationships, source: :following

  def follow(user_id)
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end

  def is_following?(user_id)
    relationship = Following.find_by(follower_id: id, following_id: user_id)
    return true if relationship
  end


end

