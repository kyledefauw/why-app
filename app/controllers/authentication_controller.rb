class AuthenticationController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate[:password]
      session[:user_id] = user.id
      flash[:notice] = 'User successfully created!'
      redirect_to '/'
    else
      render :new
    end
  end

  def destroy
    user = User.find(params[:id])
    user.delete
    redirect_to root_path, notice: 'You have successfully logged out'
  end

end
