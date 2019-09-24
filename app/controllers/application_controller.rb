class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_checkin



  def after_sign_in_path_for(resource)
    check_ins_path
  end

  def set_checkin
    @checkin = CheckIn.new
  end

end
