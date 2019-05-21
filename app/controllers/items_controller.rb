class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  def index # トップページ、アイテムをカテゴリー別に最新投稿順番に
    @items = Item.all.order(id: "DESC").limit(4)
  end

  def new
  end

  def create
    @item = Item.new(params_permit)
    render action: :new
    if @item.save
      redirect_to group_messages_path(@group)
      # モーダル表示させる
    else
      render :new
      # 入力不備部分に赤字表示させる
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

  def params_permit
    params.require(:items).permit(:name, :dondition, :delivery_fee, :delivery_days, :price, :seller_id).merge(images: [])
    # params.require(:items).permit(:name, :dondition, :delivery_fee, :delivery_days, :price, :seller_id).merge(images: [])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # def set_current_user
  #   @user = User.find(params[current_user.id])
  # end

end
