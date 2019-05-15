class ItemsController < ApplicationController
  # before_action :set_current_user

  def index # トップページ、アイテムをカテゴリー別に最新投稿順番に
    @items = Item.all.order(id: "DESC")
  end

  def new
  end

  def create
    @item = Item.new(params_permit)
    if @item.save
      redirect_to group_messages_path(@group)
      # モーダル表示させる
    else
      render :new
      # 入力不備部分に赤字表示させる
    end
  end

  def show
  end

  private

  def params_permit
    params.require(:items).permit(:name, :dondition, :delivery_fee, :delivery_days, :price, :seller_id).merge(images: [])
  end

  # def set_current_user
  #   @user = User.find(params[current_user.id])
  # end
end
