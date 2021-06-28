class SessionsController < ApplicationController

  def signin
    @user = User.new
  end
end