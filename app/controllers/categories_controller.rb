class CategoriesController < ApplicationController
  before_action :set_categories, only: :show
  before_action :set_category, only: :show

  def show
    @items = Item.where(category_id: @category.id)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
