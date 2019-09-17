class Place < ApplicationRecord
  has_many :favorite_places
  has_many :checkins

  mount_uploader :photo, PhotoUploader

end
