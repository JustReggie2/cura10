class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    raise params.inspect
  end

  def show
    @list = List.find(params[:id])
  end
end
