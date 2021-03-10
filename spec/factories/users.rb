FactoryBot.define do
  factory :user do
    nickname               { 'abc' }
    email                  { Faker::Internet.free_email }
    password               { 'aaa111' }
    password_confirmation  { password }
    last_name              { '山田' }
    first_name             { '太郎' }
    last_name_katakana     { 'ヤマダ' }
    first_name_katakana    { 'タロウ' }
    birthday               { '2000-01-01' }
  end
end
