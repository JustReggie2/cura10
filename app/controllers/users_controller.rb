class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    return redirect_to new_user_path unless @user.save
    redirect_to
  end


  def show
  end
end
