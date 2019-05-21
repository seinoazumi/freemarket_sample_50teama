class Item < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :user_items, dependent: :destroy
  has_many :users, through: :user_items
  has_many :images, dependent: :destroy
  has_many :categories

  enum ship_from: {
    hokkaido: 1, aomori: 2, iwate: 3, miyagi: 4, akita: 5, yamagata: 6, fukushima: 7,
    ibaraki: 8, tochigi: 9, gunma: 10, saitama: 11, chiba: 12, tokyo: 13, kanagawa: 14,
    nigata: 15, toyama: 16, ishikawa: 17, fukui: 18, yamanashi: 19, nagano: 20,
    gifu: 21, sizuoka: 22, aichi: 23, mie: 24,
    shiga: 25, kyoto: 26, osaka: 27, hyogo: 28, nara: 29, wakayama: 30,
    tottori: 31, shimane: 32, okayama: 33, hiroshima: 34, yamaguchi: 35,
    tokushima: 36, kagawa: 37, ehime: 38, kochi: 39,
    fukuoka: 40, saga: 41, nagasaki: 42, kumamoto: 43, oita: 44, miyazaki: 45, kagoshima: 46, okinawa: 47,
    undicided: 48
  }, _prefix: true

  enum condition: {
    new_one: 1, almost_new: 2, no_scratchies: 3, little_worn: 4, worn: 5, bad: 6
  }

  enum delivery_fee: {
    exhibitr_barden: 1, buyer_barden: 2
  }

  enum ship_by: {
    undicided: 1, mercari: 2, u_mail: 3, letter_pack: 4, usealy: 5, yamato: 6, u_pack: 7, click_post: 8, u_packet: 9
  }, _prefix: true

  enum delivery_days: {
    a_day: 1, a_couple_of_days: 2, a_week: 3
  }
end
