class Place < ApplicationRecord

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_many :checkins

  has_many :favorite_places
  include PgSearch::Model
  pg_search_scope :search_by_name_and_location,
    against: [:name, :location],
    associated_against: {
      checkins: [:type_of_music]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  TYPE_PLACE = ["Bar", "Club"]
  validates :place_type, inclusion: {in: TYPE_PLACE}


  mount_uploader :photo, PhotoUploader

end
