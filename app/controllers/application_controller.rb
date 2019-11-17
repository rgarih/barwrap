class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_checkin

  def after_sign_in_path_for(resource)
    check_ins_path
  end

  def after_sign_out_path_for(resource)
    user_registration_path
  end

  def set_checkin
    @checkin = CheckIn.new
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

end
