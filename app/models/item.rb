class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :category
  belongs_to_active_hash :scheduled_delivery
  belongs_to_active_hash :item_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to :user
  has_many :comments
  has_one :item_purchase
  has_one_attached :image

  with_options presence: true do |i|
    i.validates :image
    i.validates :name
    i.validates :explanation
    i.validates :category_id
    i.validates :area_id
    i.validates :scheduled_delivery_id
    i.validates :price
  end

  with_options numericality: { other_than: 1 } do |ah|
    ah.validates :area_id
    ah.validates :category_id
    ah.validates :scheduled_delivery_id
    ah.validates :item_status_id
    ah.validates :shipping_fee_status_id
  end
  validates :price, numericality: { greater_than: 299 }
  validates :price, numericality: { less_than: 10_000_000 }
end
