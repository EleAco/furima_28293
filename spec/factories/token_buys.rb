FactoryBot.define do
  factory :token_buy do
    zip_code           { '123-4567' }
    area_id            { 2 }
    city               { '福岡県' }
    addoress           { '大野城市' }
    phone_number       { 12_345_678_910 }
  end
end
