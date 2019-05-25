class ItemsController < ApplicationController
  require 'payjp'
  before_action :set_item, only: [:show, :destroy, :edit]
  before_action :set_params_item_id, only: [:confirm, :pay]

  def index # トップページ、アイテムをカテゴリー別に最新投稿順番に
    @items = Item.all.order(id: "DESC").limit(4)
  end

  def new
    @item = Item.new
    10.times {@item.images.build}
  end

  def create
    @item = Item.new(params_new)

    respond_to do |format|
      if @item.save
        # @itemページのpayjpカラムが問題で、出品ページに飛ばすのは現状ではエラー、記述使用の可能性あり
        # format.html { redirect_to @item, notice: 'Item was successfully created.' }
        # rails scaffold item で自動作成されたコントローラ記述をそのまま移植。
        # TODO: 仮置きredirect, 最終形=>newページ内でモーダル表示させる
        format.html { redirect_to root_path, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        # TODO: 最終形=>入力不備label部分に赤字でガイド表示させる
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
      @items = Item.order(id: 'DESC').limit(4)
  end

  def confirm
    if user_signed_in?
      Payjp.api_key = Rails.application.credentials.payjp[:secret_access_key]
      customer = Payjp::Customer.retrieve(current_user.payjp_id)
      default_card = customer.default_card
      @card = customer.cards.retrieve(default_card)
    else
      redirect_to new_user_session_path
    end
  end

  def pay #カード支払い Itemにbuyer_idを追加
    begin
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
      redirect_to root_path
    end
      @item.update(buyer_id: current_user.id)
      redirect_to root_path
  end

  def edit
  end

  def search
    @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%").limit(40)
    if @items.count == Item.all.count || params[:keyword].present? == false
      @items = Item.order(id: "DESC").limit(40)
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

  private

  def params_new
    params.require(:item).permit(:name, :condition, :detail, :delivery_method, :delivery_prefecture, :delivery_cost, :delivery_day, :price, :seller_id, images_attributes: [:image])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_params_item_id
    @item = Item.find(params[:item_id])
  end
end
