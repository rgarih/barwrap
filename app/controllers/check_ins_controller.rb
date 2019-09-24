class CheckInsController < ApplicationController
  def new
    @place = Place.find(params[:place_id])
    @checkin = CheckIn.new
  end

  def create
    if params[:place_id].present?
      @place = Place.find(params[:place_id])
    end
    @checkin = CheckIn.new(set_params)
    @checkin.user = current_user
    @checkin.place = @place
    if @checkin.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  def new_checkin
    @check_in = CheckIn.new
  end

  def create_checkin
    @place = params[:check_in][:place_id]

    if !@place.nil?
       @checkin = CheckIn.new(set_params)
       @checkin.user = current_user
       @checkin.place = Place.find(@place.to_i)
       if @checkin.save
        redirect_to place_path(@checkin.place)
      else
        render :new
      end
  end

  end

  def index
    if params[:filtered] == "true"
      @user_follows = current_user.followings
      @checkins = []

      @user_follows.each do |friend|
        @checkins << friend.check_ins.to_a
      end
      @checkins.flatten!
      @checkins.sort_by(&:created_at).reverse
    else
      @checkins = CheckIn.all.sort_by(&:created_at).reverse
    end
  end

  private

  def fetch_location
    ip = request.remote_ip
    coordinates = Geocoder.search(ip).first.coordinates
  end

  def set_params
    params.require(:check_in).permit(:comment, :type_of_music, :photo, :photo_cache)
  end
end
