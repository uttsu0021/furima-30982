class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :buy
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

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id, :condition_id, :shipping_charge_id,
              :shipping_area_id, :days_to_ship_id
  end

  validates :price, numericality: true, format: { with: /\A[0-9]+\z/ }
  validates_inclusion_of :price, in: 300..9_999_999, message: 'Out of setting range'
end
