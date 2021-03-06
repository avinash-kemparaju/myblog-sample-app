class ApplicationController < ActionController::Base
  protect_from_forgery

  # makes methods to be used in both views & other controllers
  helper_method :current_user, :signed_in?, :article_count, :category_count

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !!current_user
  end

  def article_count
    Article.count
  end

  def category_count
    Category.count
  end

  # cannot be used in views
  def require_user
    if !signed_in?
      flash[:alert] = 'You must be logged in'
      redirect_to signin_path
    end
  end

end

