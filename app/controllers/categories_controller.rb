class CategoriesController < ApplicationController
  before_action :set_categories, only: :show

  def show
    @category = Category.find(params[:id])
    @items = Item.where(category_id: @category.id)
  end
end
