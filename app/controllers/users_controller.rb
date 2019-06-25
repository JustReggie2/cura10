class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    return render :new unless @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end


  def show
    @user = User.find_by(id: params[:id])
    @lists = @user.lists
    @favs = @user.favorites
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
