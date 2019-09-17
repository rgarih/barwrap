class CheckIn < ApplicationRecord
  belongs_to :user
  belongs_to :place

  mount_uploader :photo, PhotoUploader
end
