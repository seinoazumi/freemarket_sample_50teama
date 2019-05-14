class UsersController < ApplicationController

  def show  # ユーザー個人ページ、自分の出品した商品を出品ステータス別に得る

  end


  def new

  end

  def logout
  end
  

  def edit
    render "users/mypage/#{params[:name]}"
  end
end
