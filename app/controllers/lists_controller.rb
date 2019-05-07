class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new
    10.times do
      @list.items.build
    end
  end

  def create
    # raise params.inspect
    @list = List.create(list_params)
    redirect_to list_path(@list)
  end

  def show
    @list = List.find(params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:name, :category_name, items_attributes: [:desc_link])
  end
end
