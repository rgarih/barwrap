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

  def set_params
    params.require(:check_in).permit(:comment, :type_of_music, :photo, :photo_cache)
  end
end
