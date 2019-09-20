class CheckIn < ApplicationRecord
  belongs_to :user
  belongs_to :place

  TYPE_OF_MUSIC = ["Rock", "Hip Hop", "Techno", "Mainstream", "Reggae", "Reggaeton", "Hard to tell🤔"]
  validates :type_of_music, inclusion: { in: TYPE_OF_MUSIC }, allow_blank: true

  mount_uploader :photo, PhotoUploader

end
