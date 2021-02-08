class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :product,            null: false
      t.text       :explanation,        null: false
      t.integer    :category_id,        null: false
      t.integer    :condition_id,       null: false
      t.integer    :shipping_charge_id, null: false
      t.integer    :shipping_area_id,   null: false
      t.integer    :days_to_ship_id,    null: false
      t.integer    :peice,              null: false
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
