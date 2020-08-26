FactoryBot.define do
  factory :user do
    nickname                  { Faker::Name.initials(number: 4) }
    email                     { Faker::Internet.free_email }
    password                  { Faker::Internet.password(min_length: 6) }
    password_confirmation     { password }
    first_name                { '田中' }
    last_name                 { '健二' }
    first_name_kana           { 'タナカ' }
    last_name_kana            { 'ケンジ' }
    birthday                  { Faker::Date.backward }
  end
end
