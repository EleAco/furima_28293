class Buy < ApplicationRecord
  with_options presence: true do |i|
    i.validates :zip_code
    i.validates :area_id
    i.validates :cety
    i.validates :addoress
    i.validates :phone_number
    i.validates :item_purchase_id
  end
end
