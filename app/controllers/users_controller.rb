class UsersController < ApplicationController

  def show  # ユーザー個人ページ、自分の出品した商品を出品ステータス別に得る

  end


  def new

  end

  def logout
  end

  def edit
    @user = User.find(current_user.id)
    render "users/mypage/#{params[:name]}"
  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
    redirect_to(root_path)
  end

  private

  def user_params
    params.require(:user).permit(:postal_code,:prefecture,:city,:address,:building,:phone)
  end
end
