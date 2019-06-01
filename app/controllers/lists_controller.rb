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

  private

  def list_params
    params.require(:list).permit(:name, :category_name, :user_id, items_attributes: [:desc_link])
  end
end
