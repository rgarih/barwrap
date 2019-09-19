class CheckIn < ApplicationRecord
  belongs_to :user
  belongs_to :place

  TYPE_OF_MUSIC = ["Rock", "Hip Hop", "Techno", "Mainstream", "Reggae", "Reggaeton", "Other"]
  validates :type_of_music, inclusion: { in: TYPE_OF_MUSIC }, presence: false
  mount_uploader :photo, PhotoUploader

end
