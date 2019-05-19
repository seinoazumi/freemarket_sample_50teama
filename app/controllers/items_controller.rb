class ItemsController < ApplicationController

  def index # トップページ、アイテムをカテゴリー別に最新投稿順番に
    @items = Item.all.order(id: "DESC").limit(4)
  end

  def new
  end

  def create
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.all.order(id: "DESC").limit(4) # 詳細ページの下部に4つ表示させるためのインスタンス

  end

end
