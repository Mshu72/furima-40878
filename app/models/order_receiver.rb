class OrderReceiver
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}-\d{4}\z/, message: "は「3桁ハイフン4桁」の半角文字列で入力してください"}
    validates :prefecture
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の半角数値で入力してください" }
    # validates :token
  end
  validates :prefecture, numericality: {other_than: 1, message: "を入力してください"}

  def save
    order = Order.create(item_id: item_id, token: token)
  
    Receiver.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end