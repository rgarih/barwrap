class DashboardController < ApplicationController
  def profile
    @user = User.find(params[:id])
    @followings_count = @user.followings.count
    @followers_count = @user.followers.count
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update(set_params)
    redirect_to profile_dashboard_path(current_user)
  end

  def friend_list
    @user = User.find(params[:id])

    if params[:friend_type] == "follows"
      @users = @user.followings.all
    else
      @users = @user.followers.all
    end
  end

  private

  def set_params
    params.require(:user).permit(:email, :first_name, :last_name, :photo, :location, :bio, :age, :gender)
  end
end
