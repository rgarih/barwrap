json.array! @checkins do |checkin|
  json.extract! checkin, :id, :comment, :user_id, :type_of_music, :place_id, :photo, :created_at, :place_id
end
