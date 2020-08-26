class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,                   null: false
      t.text    :explanation,            null: false
      t.integer :category_id,            null: false
      t.integer :item_status_id,         null: false
      t.integer :shipping_fee_status_id, null: false
      t.integer :area_id,                null: false
      t.integer :scheduled_delivery_id,  null: false
      t.numeric :price,                  null: false
      t.integer :user_id,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
