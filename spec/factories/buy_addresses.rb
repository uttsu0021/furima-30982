FactoryBot.define do
  factory :buy_address do
    postal_code { '123-4567' }
    shipping_area_id { 2 }
    municipality { '名古屋市' }
    address { '1-1' }
    building { '名古屋ハイツ' }
    phone { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { 1 }
    item_id { 1 }
  end
end
