class ApplicationController < ActionController::Base
  include PitchesHelper
  before_action :require_login
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user, :admin?

  def current_day(day_id)
    Day.find_by(id: day_id)
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def admin?
    return current_user.is_admin if current_user
  end

  private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to "/"
    end
  end
end
