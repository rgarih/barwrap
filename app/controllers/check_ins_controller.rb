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
    @checkins = CheckIn.all.sort_by(&:created_at).reverse
  end
  private

  def set_params
    params.require(:check_in).permit(:comment, :type_of_music, :photo, :photo_cache)
  end
end
