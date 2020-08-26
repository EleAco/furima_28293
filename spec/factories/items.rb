FactoryBot.define do
  factory :item do
    name                        { Faker::Book.title }
    explanation                 { '説明文です' }
    category_id                 { 2 }
    item_status_id              { 3 }
    shipping_fee_status_id      { 5 }
    area_id                     { 2 }
    scheduled_delivery_id       { 2 }
    price                       { 500 }
    association :user
  end
end
