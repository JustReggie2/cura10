class ListsController < ApplicationController
  before_action :require_logged_in
  skip_before_action :require_logged_in, only: [:index]
  helper_method :redirect_to

  def index
    if params[:category_id]
      @lists = Category.find(params[:category_id]).lists
    else
      @lists = List.all
    end
  end

  def most_votes
    @lists = List.most_votes
  end

  def new
    user_id = current_user.id
    @list = List.new(user_id: user_id)
    10.times do
      @list.items.build
    end
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, alert: @list.errors.full_messages
    end
  end

  def show
    @list = List.find(params[:id])
    @user = current_user
  end

  def favorite
    @user = current_user
    @list = List.find(params[:id])
    if @user.favorited?(@list)
      @user.favorites.delete(@list)
      redirect_to list_path(@list), notice: "List has been removed from your favorites."
    else
      @user.favorites << @list
      redirect_to list_path(@list), notice: "List has been added to your favorites."
    end
  end

  def up_vote
    @user = current_user
    @list = List.find(params[:id])
    helpers.u_vote(@user, @list)
  end

  def down_vote
    @user = current_user
    @list = List.find(params[:id])
    helpers.d_vote(@user, @list)
  end

  def destroy
    @user = current_user
    @list = List.find(params[:id])
    if @list.user == @user
      @list.items.delete
      @list.delete
    else
      redirect_to list_path(@list), alert: "Something went wrong. Try again."
    end
    redirect_to user_path(@user), notice: "List has been deleted."
  end

  private

  def list_params
    params.require(:list).permit(:name, :category_name, :user_id, items_attributes: [:desc_link])
  end
end
