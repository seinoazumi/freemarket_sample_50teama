class ItemsController < ApplicationController
  require 'payjp'
  before_action :set_item, only: [:show, :destroy, :pay]

  def index # トップページ、アイテムをカテゴリー別に最新投稿順番に
    @items = Item.all.order(id: "DESC").limit(4)
  end

  def new
  end

  def create
  end

  def show
    # カード情報引き出し
    if params[:url] == "confirm"
      if user_signed_in?
        Payjp.api_key = Rails.application.credentials.payjp[:secret_access_key]
        customer = Payjp::Customer.retrieve(current_user.payjp_id)
        default_card = customer.default_card
        @card = customer.cards.retrieve(default_card)
        render "/items/#{params[:url]}"
      else
        redirect_to new_user_session_path
      end
    else
      @items = Item.all.order(id: 'DESC').limit(4)
    end
  end

  def pay #カード支払い Itemにbuyer_idを追加
      Payjp.api_key = Rails.application.credentials.payjp[:secret_access_key]
      customer = Payjp::Customer.retrieve(current_user.payjp_id)
      default_card = customer.default_card
      card = customer.cards.retrieve(default_card)
      charge = Payjp::Charge.create(
        amount: @item.price,
        customer: customer,
        currency: 'jpy',
      )
    rescue => e #エラーハンドリング
      arert
      redirect_to root_path
    end
      @item.update(buyer_id: current_user.id)
      redirect_to root_path
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

  def set_item
    @item = Item.find(params[:id])
  end

 end
