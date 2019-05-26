class CardsController < ApplicationController
<<<<<<< Updated upstream
<<<<<<< Updated upstream
  before_action :authenticate_user!
  before_action :set_item, only:[:pay]
  before_action :set_category
  require 'payjp'

  def index #クレジットカード情報表示
    Payjp.api_key = Rails.application.credentials.payjp[:secret_access_key]
    customer = Payjp::Customer.retrieve(current_user.payjp_id)
    if customer.default_card
      default_card = customer.default_card
      @card = customer.cards.retrieve(default_card)
    end
  end

  def card_new #クレジットカード登録
    Payjp.api_key = Rails.application.credentials.payjp[:secret_access_key]
    customer = Payjp::Customer.retrieve(current_user.payjp_id)
    customer.cards.create(card: params[:payjp_token])
    redirect_to user_cards_path(user_id:"mypage")
  rescue => e
      redirect_to new_user_card_path(user_id:"mypage")
  end

  def card_delete #カード情報削除
=======
  require 'payjp'
  before_action :set_item, only:[:card_delete, :pay]

=======
  require 'payjp'
  before_action :set_item, only:[:card_delete, :pay]

>>>>>>> Stashed changes
  def card_new
    begin
      Payjp.api_key = Rails.application.credentials.payjp[:secret_access_key]
      customer = Payjp::Customer.retrieve(current_user.payjp_id)
      customer.card.create(card: token)
    rescue => e

    end

  end

  def card_delete #カード情報削除
    begin
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
    Payjp.api_key = Rails.application.credentials.payjp[:secret_access_key]
    customer = Payjp::Customer.retrieve(current_user.payjp_id)
    default_card = customer.default_card
    card = customer.cards.retrieve(default_card)
    card.delete
<<<<<<< Updated upstream
<<<<<<< Updated upstream
    redirect_to user_cards_path(user_id: 'mypage')
  rescue => e #エラーハンドリング
    redirect_to user_cards_path(user_id: 'mypage')
  end

  def pay #カード支払い / Itemにbuyer_idを追加、statusを変更
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
      @item.update(buyer_id: current_user.id, status:2)
      redirect_to root_path
  end


  def set_item
    @item = Item.find(params[:id])
  end
=======
=======
>>>>>>> Stashed changes
    rescue => e #エラーハンドリング
      redirect_to root_path
    end
      @item.update(buyer_id: current_user.id)
      redirect_to root_path
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
    @item.update(buyer_id: current_user.id, status:2)
    redirect_to root_path
end


def set_item
  @item = Item.find(params[:id])
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
end
