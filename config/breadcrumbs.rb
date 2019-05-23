crumb :root do
  link "メルカリ", root_path
end

crumb :user do
  link "マイページ", user_path(id: 'mypage')
end

crumb :logout do
  link "ログアウト", edit_path(url: 'logout')
  parent :user
end

crumb :identification do
  link "本人情報の登録", edit_path(url: 'identification')
  parent :user
end

crumb :profile do
  link "プロフィール", edit_path(url: 'profile')
  parent :user
end

crumb :item do
  item = Item.find(params[:id])
  link item.name, item_path(id: item.id)
end

crumb :card do
  link "支払い方法", card_path(id: 'show')
  parent :user
end

crumb :new_card do
  link "クレジットカード情報入力", new_card_path
  parent :card
end

crumb :search do
  link params[:keyword], search_items_path
end