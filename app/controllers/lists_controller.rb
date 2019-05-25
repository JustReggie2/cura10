class ListsController < ApplicationController

  def index
    @lists = List.all
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
    raise params.inspect
  end

  private

  def list_params
    params.require(:list).permit(:name, :category_name, :user_id, items_attributes: [:desc_link])
  end
end
