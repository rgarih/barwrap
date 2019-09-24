
class PlacesController < ApplicationController

  def index
    @checkins = CheckIn.all
    @markersCheckIn = []
    @checkins.each do |checkin|
      if !checkin.place.nil?
        @markersCheckIn << {
          lat: checkin.place.latitude,
          lng: checkin.place.longitude
        }
      end
    end
    @places = Place.geocoded
    if params[:query].present?
      @places = Place.search_by_name_and_location(params[:query])
    end
    if params[:search].present?
      if params[:search][:types].present?
        @places = @places.select do |place|
          unless place.check_ins.last.nil?
            params[:search][:types].include?(place.check_ins.last.type_of_music)
          end
        end
      end
      if params[:search][:distance].present?
        @places = @places.near(fetch_location, params[:search][:distance])
      end
    end
    @markers = []
    @places.each do |place|
      @markers << {
        lat: place.latitude,
        lng: place.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { place: place})
      }
    end
  end

  def recommended
    @place = Place.new
    @places = Place.all
    checkins = CheckIn.all
    @most_recent_checkins = checkins.select { |checkin|
      (Time.new - 18_000) < checkin.created_at }
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
          if !@recommended.include?(checkin.place)
            @recommended << checkin.place if fav_place.place == fav_place_current.place
          end
        end
      end
    end
  end

  def show
    checkins = CheckIn.all
    @place = Place.find(params[:id])
    @markers = []
    @markers << {
        lat: @place.latitude,
        lng: @place.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { place: @place}),
    }
    @most_recent_checkins = checkins.select {|checkin|
      (Time.new - 18_000) < checkin.created_at
    }
    @place_checkins_history = checkins.select do |checkin|
      checkin.place == @place
    end

    @place_checkins_history = @place_checkins_history.sort_by(&:created_at).reverse
    fav_places_arr = []
      current_user.favorite_places.each do |fav|
        fav_places_arr.push(fav.place)
      end
     @favorited = fav_places_arr.include?(@place)
  end

  def favorite
    @place = Place.find(params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @place
      redirect_back fallback_location: check_ins_path

    elsif type == "unfavorite"
      current_user.favorites.delete(@place)
      redirect_back fallback_location: check_ins_path

    else
      # Type missing, nothing happens
      redirect_back fallback_location: check_ins_path, notice: 'Nothing happened.'
    end
  end

  private

  def fetch_location
    ip = request.remote_ip
    coordinates = Geocoder.search(ip).first.coordinates
  end

  def set_params
    params.require(:place).permit[:name, :location, :place_type, :description, :photo]
  end
end
