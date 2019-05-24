# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

1.upto(11) do |num|
  User.create(
    name: "user#{num}",
    email: "user#{num}@gmail.com",
    password: "11111111",
    first_name: "寧夢#{num}",
    last_name: "遊座#{num}",
    first_name_kana: "ネイム",
    last_name_kana: "ユウザ",
    postal_code: 1000000 + num,
    prefecture: rand(1..47),
    city:"保外市#{num}",
    building: "富嶽ビル#{num}",
    address:"#{num}",
    phone: 9000000000 + num + num * 10000,
    birthday: '2000-01-01',
    money: 50000 + num * 1000,
    point: 3000 + num * 100,
    seller_id: num,
    buyer_id: num,
    profile: "user#{num}です、よろしく！",
    payjp_id: "cus_8f1bf365e98a8c5a6ce7f313e3c3"
    )
  # TODO: エラーは出ないが作成できない 現状テーブルに外部キー設定なし影響？？ パンケーキ手焼きは可能
  # 同一ユーザーによるダブりデータができない方法をとる（ダブるとどうなるか不明）
  if num % 2 == 0
    Like.create(buyer_id: num, item_id: (num + 11) % 60)
    Like.create(buyer_id: num, item_id: (num + 21) % 60)
    Like.create(buyer_id: num, item_id: (num + 31) % 60)
    Like.create(buyer_id: num, item_id: (num + 41) % 60)
    Like.create(buyer_id: num, item_id: (num + 51) % 60)
    if num % 3 == 1
      Like.create(buyer_id: num, item_id: (num + 15) % 60)
      Like.create(buyer_id: num, item_id: (num + 35) % 60)
    elsif num % 3 == 2
      Like.create(buyer_id: num, item_id: (num + 45) % 60)
    else
      Like.create(buyer_id: num, item_id: (num + 5) % 60)
      Like.create(buyer_id: num, item_id: (num + 25) % 60)
      Like.create(buyer_id: num, item_id: (num + 55) % 60)
    end
  else
    Like.create(buyer_id: num, item_id: (num * num + 10) % 60)
    Like.create(buyer_id: num, item_id: (num * num + 30) % 60)
    Like.create(buyer_id: num, item_id: (num * num + 50) % 60)
    if num % 5 == 0
      Like.create(buyer_id: num, item_id: (num * num + 20) % 60)
      Like.create(buyer_id: num, item_id: (num * num + 40) % 60)
    end
    if num % 7 == 0
      Like.create(buyer_id: num, item_id: (num * num + 0) % 60)
    end
  end
end

1.upto(33) do |num|
  Item.create(
    name: "お買い得セット#{num}",
    condition: rand(1..6),
    delivery_cost: rand(1..2),
    delivery_day: rand(1..3),
    price: num * 1000,
    detail: "この文章は商品説明用です！この商品のIDは#{num}です！yay!",
    delivery_prefecture: rand(1..48),
    delivery_method: rand(1..9),
    status: rand(0..2)
    )
end

1.upto(33) do |num|
  UserItem.create(user_id: num, item_id: num * 3 - 2)
  UserItem.create(user_id: num, item_id: num * 3 - 1)
  UserItem.create(user_id: num, item_id: num * 3 - 0)
end

1.upto(33) do |num|
  1.upto(10) do |n|
    image_path = "#{Rails.root}/app/uploaders/dummy_images/m#{num}_#{n}.jpg"
    Image.create(item_id: num,image: open(image_path)) if File.exist?(image_path)
  end
end
