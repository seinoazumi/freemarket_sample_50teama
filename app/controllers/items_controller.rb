class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  def index # トップページ、アイテムをカテゴリー別に最新投稿順番に
    @items = Item.all.order(id: "DESC").limit(4)
  end

  def new
    @item = Item.new
    10.times {@item.images.build}
  end

  def create
    @item = Item.new(params_new)
    render action: :new
    if @item.save
      # TODO: 仮置きredirect, 最終形=>newページ内でモーダル表示させる
      redirect_to root_path
    else
      # TODO: 最終形=>入力不備label部分に赤字でガイド表示させる
      flash.now[:alert] = "出品に失敗"
      render :new
    end
  end

  def edit
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

  private

  def params_new
    params.require(:item).permit(:name, :condition, :detail, :ship_by, :ship_from, :delivery_fee, :delivery_days, :price, :seller_id, images_attributes: [:image])
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
