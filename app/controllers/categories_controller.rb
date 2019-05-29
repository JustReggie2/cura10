class CategoriesController < ApplicationController

  def index
    @lists = List.find_by(category_id: params[:category_id])
  end
end
