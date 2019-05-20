class ItemsController < ApplicationController

  def index # トップページ、アイテムをカテゴリー別に最新投稿順番に
    @items = Item.all.order(id: "DESC").limit(4)
  end

  def new
  end

  def create
  end

  def show
    @items = Item.all.order(id: 'DESC').limit(4)
    @item = Item.find(params[:id])
    render "/items/#{params[:url]}" if params[:url]
  end

end
