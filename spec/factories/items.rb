FactoryBot.define do
  factory :item do
    name          {"シューズ"}
    condition     {"new_one"}
    delivery_fee  {"exhibitr_barden"}
    delivery_days {"a_day"}
    price {       "1000"}
    buyer_id      {"1"}
    detail        {"靴です"}
    ship_from     {"hokkaido"}
    ship_by       {"undicided"}
  end
end
