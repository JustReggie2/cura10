class ListsController < ApplicationController
  before_action :require_logged_in
  skip_before_action :require_logged_in, only: [:index]

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
    @list = List.new(user_id: params[:user_id])
    10.times do
      @list.items.build
    end
  end

  def create
    # raise params.inspect
    @list = List.create(list_params)
    # raise params.inspect
    redirect_to list_path(@list)
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
      redirect_to list_path(@list)
    else
      @user.favorites << @list
      redirect_to list_path(@list)
    end
  end

  def up_vote
    @user = current_user
    @list = List.find(params[:id])
    if @user.favorited?(@list)
      @fav_vote = FavoriteList.find_by(user_id: @user.id, list_id: @list.id)
      if @fav_vote.vote == nil || @fav_vote.vote == 0
        @fav_vote.vote = 1
        @fav_vote.save
        redirect_to list_path(@list), notice: "Vote recorded!"
      else
        redirect_to list_path(@list), alert: "Unable to vote, perhaps you already did."
      end
    else
      redirect_to list_path(@list), alert: "You must favorite list to to vote."
    end
  end

  def down_vote
    @user = current_user
    @list = List.find(params[:id])
    if @user.favorited?(@list)
      @fav_vote = FavoriteList.find_by(user_id: @user.id, list_id: @list.id)
      if @fav_vote.vote == 1
        @fav_vote.vote -=1
        @fav_vote.save
        redirect_to list_path(@list), notice: "Vote recorded!"
      else
        redirect_to list_path(@list), alert: "Unable to vote, perhaps you already did."
      end
    else
      redirect_to list_path(@list), alert: "You must favorite list to to vote."
    end
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
