class PlacesController < ApplicationController
  def map
  end

  def index
    @places = Place.all
  end

  def recommended
    places = Place.all
    checkins = CheckIn.all
    @most_recent_checkins = checkins.select {|checkin|
        (Time.new - 18000) > checkin.created_at
    }.first(15)
    #18000 seconds in 5 houars
    hash = {}
    @most_recent_checkins.each do |checkin|
      if hash[checkin.place].nil?
        hash[checkin.place] = 1
      else
        hash[checkin.place] += 1
      end
    end
    @most_talked_about = hash.sort_by { |k, v| v }.first(10).map do |array|
      array[0]
    end
    @recommended = []
    @most_recent_checkins.each do |checkin|
      checkin.user.favorite_places.each do |place|
        @recommended << checkin.place if current_user.favorite_places.include?(place)
      end
    end
  end

  def checkin

  end
end
