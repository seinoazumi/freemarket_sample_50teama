class ItemsController < ApplicationController

  def index # トップページ、アイテムをカテゴリー別に最新投稿順番に
    @items = Item.all.order(id: "DESC").limit(4)
  end

  def new
  end

  def create
  end

  def edit
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to action: 'index'
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.all.order(id: "DESC").limit(4)
    # require 'payjp'
    # Payjp.api_key = Rails.application.credentials.payjp[:secret_access_key]
    # customer = Payjp::Customer.retrieve(current_user.payjp_id)
    # @card_id = customer.default_card
    # @card = customer.cards.retrieve(@card_id)
    render "/items/#{params[:url]}" if params[:url]
  end

 end
