json.array! @places do |place|
  json.extract! place, :id, :name, :location, :place_type, :photo, :created_at
end
