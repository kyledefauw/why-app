class AuthenticationController < ApplicationController

  def new

  end

  def create
    user = User.new(email: params[:email])
    if user && user.authenticate[:password]
      session[:user_id] = user.id
      flash[:notice] = 'User successfully created!'
      redirect_to '/'
  end

end
