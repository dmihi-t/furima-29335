class ShippingAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :order
  belongs_to_active_hash :prefecture

  validates :postal_code, :city, :address, :phone_number, presence: true
  validates :postal_code, format: { with: /^\d{3}[-]\d{4}$/ }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :phone_number, length: { maximum: 11 }
end
