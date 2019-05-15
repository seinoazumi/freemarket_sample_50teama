class ItemsController < ApplicationController

  def index # トップページ、アイテムをカテゴリー別に最新投稿順番に
  end

  def new
    @item = Item.new(params_permit)
  end

  def create
  end

  private
  def params_permit
    params.require(:items).permit(:name, :dondition, :delivery_fee, :delivery_days, :price, :buyer_id, :seller_id).merge(images: [])
  end
end
