class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  def index # トップページ、アイテムをカテゴリー別に最新投稿順番に
    @items = Item.all.order(id: "DESC").limit(4)
  end

  def new
  end

  def create
  end

  def edit
  end

  def search
    @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%").limit(40)
    if @items.present? == false
      @items = Item.all.order(id: "DESC").limit(40)
    end
    # 余裕があればkaminariを入れて、limit(40)を外す
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to item_path(@item)
    end
  end

  def show
    @items = Item.all.order(id: "DESC").limit(4)
    require 'payjp'
    Payjp.api_key = Rails.application.credentials.payjp[:secret_access_key]
    customer = Payjp::Customer.retrieve(current_user.payjp_id)
    @card_id = customer.default_card
    @card = customer.cards.retrieve(@card_id)
    render "/items/#{params[:url]}" if params[:url]
  end

  def set_item
    @item = Item.find(params[:id])
  end

 end
