class RegistrationsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:first_name, :last_name, :date_of_birth, :email, :password, :password_confirmation))
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/', notice: "Account successfully created!"
    else
      render :new
    end
  end

end
