class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
  end

  def show
    @list = List.find(id params[:id])
  end
end
