FactoryBot.define do
  factory :buy_address do
    postal_code { '123-4567' }
    shipping_area_id { 2 }
    municipality { '名古屋市' }
    address { '1-1' }
    building { '名古屋ハイツ' }
    phone { '09012345678' }
  end
end
