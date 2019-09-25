class UsersController < ApplicationController
skip_before_action :verify_authenticity_token, only: [:follow, :unfollow]
  before_action :set_user, only: [:follow, :unfollow, :edit, :update]

  def index
    @users = User.where.not(id: current_user.id)
  end

  def follow
    if current_user.follow(@user.id)
      @followings_count = @user.followings.count
      @followers_count = @user.followers.count
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def unfollow
    if current_user.unfollow(@user.id)
    @followings_count = @user.followings.count
    @followers_count = @user.followers.count
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
    redirect_to  check_ins_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :photo, :location, :bio, :age, :gender, :username)

  end
end
