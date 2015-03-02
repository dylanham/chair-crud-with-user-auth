class RegistrationsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(params.require(:user).permit(:email, :password, :password_confirmation))
    if user.save
      flash[:notice] = "Thank you for Signing up!"
      session[:user_id] = user.id
      redirect_to root_path
    else
      @user = user
      render :new
    end
  end

end
