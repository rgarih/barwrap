
class PlacesController < ApplicationController

  def index
    @places = Place.geocoded
    @markers = []

    @places.each do |place|
      @markers << {
        lat: place.latitude,
        lng: place.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { place: place}),
      }
    end
  end

  def show
    @place = Place.find(params[:id])
    @markers = []
    @markers << {
        lat: @place.latitude,
        lng: @place.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { place: @place}),
      }
  end

  def recommended
    @place = Place.new
    places = Place.all
    checkins = CheckIn.all
    @most_recent_checkins = checkins.select {|checkin|
      (Time.new - 18_000) < checkin.created_at
    }
    #18000 seconds in 5 hours
    #showing only checkin from past 5 hours
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
    checkins.each do |checkin|
      checkin.user.favorite_places.each do |fav_place|
        current_user.favorite_places.each do |fav_place_current|
          @recommended << checkin.place if fav_place.place == fav_place_current.place
        end
      end
    end
  end

  def checkin
  end
end
