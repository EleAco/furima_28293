class Buy < ApplicationRecord
  with_options presence: true do |i|
    i.validetes :zip_code
    i.validates :area_id
    i.validetes :cety
    i.validetes :addoress
    i.validetes :phone_number
    i.validetes :item_purchase_id
  end
end
