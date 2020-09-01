class TokenBuy
  include ActiveModel::Model
  attr_accessor :token, :zip_code, :area_id, :city, :addoress, :building_name, :phone_number, :user_id, :item_id

  # モデルbuyから持ってきたバリデーション
  with_options presence: true do |i|
    i.validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    i.validates :area_id, numericality: { other_than: 1 }
    i.validates :city
    i.validates :addoress
    i.validates :phone_number, format: { with: /\A\d{11}\z/ }
  end

  # item_parchaseから持ってきたバリデーション
  # with_options presence: true do |i|
  #   i.validates :user_id
  # i.validates :item_id
  # end

  def save
    @item_purchase = ItemPurchase.create(user_id: user_id, item_id: item_id)
    Buy.create(zip_code: zip_code, area_id: area_id, city: city, addoress: addoress,
               building_name: building_name, phone_number: phone_number, item_purchase_id: @item_purchase.id)
  end
end
