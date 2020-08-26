class ItemPurchase < ApplicationRecord
  has_one :buy
  belongs_to :user
  bolongs_to :item
end
