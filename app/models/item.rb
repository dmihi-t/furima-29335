class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_shipping

  validates :name, :description, :category, :status, :delivery_fee, :prefecture, :days_shipping, presence: true

  validates :category_id, :status_id, :delivery_fee_id, :prefecture_id, :days_shipping_id, numericality: { other_than: 1 } 

end