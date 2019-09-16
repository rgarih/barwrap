class DashboardController < ApplicationController
  def profile
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update(set_params)
    redirect_to profile_dashboard_path(current_user)
  end

  private

  def set_params
    params.require(:user).permit(:email, :first_name, :last_name, :photo, :location, :bio, :age, :gender)
  end
end
