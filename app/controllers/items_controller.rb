class ItemsController < ApplicationController
  require 'payjp'

  def index # トップページ、アイテムをカテゴリー別に最新投稿順番に
    @items = Item.all.order(id: "DESC").limit(4)
  end

  def new
  end

  def create
  end

  def show
    # カード情報引き出し
    Payjp.api_key = Rails.application.credentials.payjp[:secret_access_key]
    customer = Payjp::Customer.retrieve(current_user.payjp_id)
    default_card = customer.default_card
    @card = customer.cards.retrieve(default_card)

    @items = Item.all.order(id: 'DESC').limit(4)
    @item = Item.find(params[:id])
    render "/items/#{params[:url]}" if params[:url]
  end

  def pay #カード支払い Itemにbuyer_idを追加
    Payjp.api_key = Rails.application.credentials.payjp[:secret_access_key]
    customer = Payjp::Customer.retrieve(current_user.payjp_id)
    default_card = customer.default_card
    card = customer.cards.retrieve(default_card)
    @item = Item.find(params[:id])
    charge = Payjp::Charge.create(
      amount: @item.price,
      customer: customer,
      currency: 'jpy',
    )
    item= Item.find(params[:id]) 
    item.update(buyer_id: current_user.id)
    flash[:notice] = "商品を購入しました"
    redirect_to root_path
  end


end
