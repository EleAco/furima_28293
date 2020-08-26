class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.string       :zip_code,         null: false
      t.integer      :area_id,          null: false
      t.string       :city,             null: false
      t.string       :addoress,         null: false
      t.string       :building_name
      t.numeric      :phone_number,     null: false
      t.integer      :item_purchase_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
