class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash['notice'] = 'Sign Up successful'
      redirect_to @user
    else
      render 'new'
    end
  end
end