class Place < ApplicationRecord
  has_many :favorite_places
  has_many :checkins

end
