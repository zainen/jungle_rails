class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user && @user.password
      @user.password.strip!
    end
    @user.email.downcase!
    if @user.password && @user.password.length < 5
      flash[:alert] = 'Please enter a character longer than 5 characters long spaces dont count silly'
      redirect_to '/signup'
    else
      if checker[:password] == checker[:password_confirmation]
        if @user.save
          session[:user_id] = @user.id
          redirect_to :root, notice: 'User created!'
        else
          flash[:alert] = @user.errors.full_messages[0]
          redirect_to '/signup'
        end
      else
        flash[:alert] = 'Password confirmation failed!'
        redirect_to '/signup'
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password
    )
  end
  def checker
    params.require(:user)
  end
  def check_if_user_exists (email)
    @email = email
    if User.find_by email: @email
      false
    else
      true
    end
  end
end
