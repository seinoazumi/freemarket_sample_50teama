class UsersController < ApplicationController

  def show  # ユーザー個人ページ、自分の出品した商品を出品ステータス別に得る

  end


  def new

  end

  def logout
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:postal_code,:prefecture,:city,:address,:building,:phone)
  end
end
