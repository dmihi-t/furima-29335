class OrderShipping

  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefectures_id, :city, :address, :phone_number

  validates :token, :postal_code, :city, :address, :phone_number, presence: true
  validates :postal_code, format: { with: /^\d{3}[-]\d{4}$/ }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :phone_number, length: { maximum: 11 }

  def save
    Order.create(item_id: @item.id, user_id: @item.user.id, )
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture.id, city: city, address: address, building_name: building_name, phone_number: phone_number,order_id: order.id)
  end
  
end