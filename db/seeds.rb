# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |num|
  User.create(name: "user#{num + 1}", email: "user#{num + 1}@gmail.com", password: "11111111", first_name: "寧夢#{num + 1}", last_name: "遊座#{num + 1}", first_name_kana: "ネイム", last_name_kana: "ユウザ", postal_code: 1000000 + num, prefecture: num % 47 + 1, city:"保外市#{num + 1}",building: "富嶽ビル#{num + 1}", address:"#{num + 1}", phone: 9000010001 + num + num * 10000, birthday: '2000-01-01', money: 50000 + (num + 1) * 1000, point: 3000 + (num + 1) * 100, seller_id: num + 1, buyer_id: num + 1, profile: "user#{num + 1}です、よろしく！")
end

60.times do |num|
  Item.create(name: "お買い得セット#{num + 1}", condition: num % 6 + 1, delivery_fee: 1000 + (num + 1) * 10, delivery_days: num % 4 + 1, price: (num + 1) * 1000)
end

60.times do |num|
  UserItem.create(user_id: (num + 1), item_id: num * 3 + 1)
  UserItem.create(user_id: (num + 1), item_id: num * 3 + 2)
  UserItem.create(user_id: (num + 1), item_id: num * 3 + 3)
end
