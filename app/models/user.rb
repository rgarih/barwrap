class User < ApplicationRecord
  has_many :favorite_places

  mount_uploader :photo, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorite_places
  has_many :checkins


  has_many :followings

  has_many :follower_relationships, foreign_key: :following_id, class_name: "Following"
  has_many :followers, through: :follower_relationships, source: :follower


  has_many :following_relationships, source: :followings, foreign_key: :follower_id, class_name: "Following"
  has_many :followings, through: :following_relationships, source: :following

  include PgSearch::Model
  pg_search_scope :search_by_first_name_and_last_name_and_username,
    against: [ :first_name, :last_name, :username ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
