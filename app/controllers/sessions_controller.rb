class SessionsController < ApplicationController
  def new
  end

  def create
    if auth
      user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.image = auth['info']['image']
        u.password = SecureRandom.hex
      end

      session[:user_id] = user.id

      redirect_to user_path(user)
    else
      user = User.find_by(name: params[:user][:name])
      user = user.try(:authenticate, params[:user][:password])
      return redirect_to login_path unless user
      @user = user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def destroy
    session.delete :user_id

    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
