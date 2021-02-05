class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    raise User.all.inspect
    if @user.save
      session[:user_id] = @user.id
      redirect_to :root, notice: 'User created!'
    else
      redirect_to '/signup'
    end
  end
end
