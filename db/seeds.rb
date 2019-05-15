# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |num|
  User.create(name: "user#{num}", email: "user#{num}@gmail.com", password: "11111111", encrypted_password: "11111111", first_name: "寧夢#{num}", last_name: "遊座#{num}", first_name_kana: "ネイム", last_name_kana: "ユウザ", postal_code: 1000000 + num, prefecture: num + 1, city:"保外市",building: "富嶽ビル", address:"#{num}", phone: 9000000000 + num + num * 10000, birthday: '2000-01-01', money: 50000, point: 3000, seller_id: num, buyer_id: num, profile: "よろしく！")
end

60.times do |num|
  Item.create(name: "お買い得セット#{num + 1}", condition: 0, delivery_fee: 1000, delivery_days: 0, price: (num + 1) * 1000)
end
