class SessionsController < ApplicationController
  def new
  end
  
  def create
    @email = params[:login][:email]
    @password = params[:login][:password]
    if @password.strip!
      @password.strip!
    end
    @user = User.find_by_email(@email)
    if User.authenticate_with_credentials(@email, @password)
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:alert] = 'Invalid email / password.'
      redirect_to '/signup'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
