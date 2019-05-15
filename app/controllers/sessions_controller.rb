class SessionsController < ApplicationController
  def new
  end

  def create
    # raise params.inspect
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    return redirect_to login_path unless user
    @user = user
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
  end
end
