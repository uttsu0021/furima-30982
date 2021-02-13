FactoryBot.define do
  factory :item do
    product               {'テスト'}
    explanation           {'テストの説明'}
    category_id           {2}
    condition_id          {2}
    shipping_charge_id    {2}
    shipping_area_id      {2}
    days_to_ship_id       {2}
    price                 {300}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/top.png'), filename: 'top.png')
    end

    association :user
  end
  end