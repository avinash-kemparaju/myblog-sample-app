class SessionsController < ApplicationController

  def new
  end

  def create
    puts params
    user = User.where(email: params[:session][:email].downcase).first
    if user
      if user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:notice] = 'SignIn successful'
        redirect_to user
      else
        puts "password mismatch"
        flash[:alert] = "Invalid Sign In details"
        redirect_to signin_path
      end
    else
      flash[:alert] = "Account not found"
      redirect_to signin_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Sign Out successful'
    redirect_to root_path
  end
end