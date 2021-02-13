class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :days_to_ship

  validates :product, :explanation, :category_id, :condition_id,
            :shipping_charge_id, :shipping_area_id, :days_to_ship_id,
            :price, :image,
            presence: true

  validates :category_id, :condition_id, :shipping_charge_id,
            :shipping_area_id, :days_to_ship_id,
            numericality: { other_than: 1 }

  validates :price, numericality: true
 validates_inclusion_of :price, in:300..9999999, message: ' Out of setting range'
end
