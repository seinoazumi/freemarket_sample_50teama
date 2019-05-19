<<<<<<< Updated upstream
class CardsController < ApplicationController
  require "payjp"

  def new # カードの登録
    card = Card.where(user_id: current_user.id)
    binding.pry
    redirect_to action: "show" if card.exists? # カードが存在していればredirect
  end

  def pay #payjp内で顧客情報(トークン＆メタデータを保持)を作成
    Payjp.api_key = '
    sk_test_b486b3703ec1656553c4921a'
    if params['payjpToken'].blank?
      redirect_to action: 'new'
    else
      customer = Payjp::Customer.create(
        card: params['payjpToken'],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save #user_id,payjpでのid,デフォルトカードをmysqlのdbに登録
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete # payjp＆mysqlのデータ削除
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = 'pk_test_bd6af6f7d2f00fbfda8c3ae1'

      customer = Payjp::customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
    redirect_to action: "new"
  end

  def show
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = 'pk_test_bd6af6f7d2f00fbfda8c3ae1'
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
=======
# class CardsController < ApplicationController
#   require "payjp"

#   def new # カードの登録
#     card = Card.where(user_id: current_user.id)
#     binding.pry
#     redirect_to action: "show" if card.exists? # カードが存在していればredirect
#   end

#   def pay #payjp内で顧客情報(トークン＆メタデータを保持)を作成
#     Payjp.api_key = '
#     sk_test_b486b3703ec1656553c4921a'
#     if params['payjpToken'].blank?
#       redirect_to action: 'new'
#     else
#       customer = Payjp::Customer.create(
#         card: params['payjpToken'],
#         metadata: {user_id: current_user.id}
#       )
#       @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
#       if @card.save #user_id,payjpでのid,デフォルトカードをmysqlのdbに登録
#         redirect_to action: "show"
#       else
#         redirect_to action: "pay"
#       end
#     end
#   end

#   def delete # payjp＆mysqlのデータ削除
#     card = Card.where(user_id: current_user.id).first
#     if card.blank?
#     else
#       Payjp.api_key = Rails.application.credentials.payjp[:access_key]

#       customer = Payjp::customer.retrieve(card.customer_id)
#       customer.delete
#       card.delete
#     end
#     redirect_to action: "new"
#   end

#   def show
#     card = Card.where(user_id: current_user.id).first
#     if card.blank?
#       redirect_to action: "new"
#     else
#       Payjp.api_key = Rails.application.credentials.payjp[:access_key]
#       customer = Payjp::Customer.retrieve(card.customer_id)
#       @default_card_information = customer.cards.retrieve(card.card_id)
#     end
#   end
>>>>>>> Stashed changes

#   def show
#   end

# end
