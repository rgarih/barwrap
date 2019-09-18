class UsersController < ApplicationController
  before_action :set_user, only: [:follow, :unfollow, :edit, :update]

  def index
    @users = User.where.not(id: current_user.id)
  end

  def follow
    if current_user.follow(@user.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def unfollow
    if current_user.unfollow(@user.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { render action: :follow }
      end
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
  end

  private

  def set_user
    @user = User.find(params[:id])
    redirect_to places_checkin_path
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :photo, :location, :bio, :age, :gender, :username)
  end
end
