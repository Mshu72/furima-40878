class OrderReceiver
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :address, :building, :phone_number, :price, :user_id, :token

  with_options presence: true do
    validates :price_id
    validates :user_id
    validates :postal_code, format: {with: /\A\d{3}-\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "must be 10 or 11 digits" }
    validates :token
  
  end
  validates :prefecture, numericality: {other_than: 1, message: "can't be blank"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id, token: token)
  
    Receiver.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end