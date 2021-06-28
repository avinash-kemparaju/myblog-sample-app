class UsersController < ApplicationController
  before_filter :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash['notice'] = 'Sign Up successful'
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
  end

  def show
  end

  def edit
  end


  def update
    if @user.update_attributes(params[:user])
      flash['notice'] = 'Update successful'
      redirect_to @user
    end
  end

  def destroy
    if @user.destroy
      session[:user_id] = nil
      flash['notice'] = 'Account deleted successfully'
      redirect_to root_path
    else
      flash['notice'] = 'Unable to delete account'
      redirect_to @user
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end