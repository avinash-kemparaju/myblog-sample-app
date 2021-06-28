class ApplicationController < ActionController::Base
  protect_from_forgery

  # makes methods to be used in both views & other controllers
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  # can be used in views
  def require_user
    if !logged_in?
      flash[:alert] = 'You must be logged in'
      redirect_to signin_path
    end
  end

end
