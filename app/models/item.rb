class Item < ApplicationRecord
  validates :title,                  presence: true
  validates :detail,                 presence: true
  validates :price,                  presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 } do
    validate  :price_format
  end
  validates :images,                 presence: true, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
  validates :prefecture_id,          numericality: { other_than: 1 , message: "can't be blank"}
  validates :category_id,            numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_id,        numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_scheduled_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id,              numericality: { other_than: 1 , message: "can't be blank"}

  private

  def price_format
    unless /\A[0-9]+\z/.match?(price.to_s)
      errors.add(:price, "must be a half-width number")
    end
  end

  belongs_to :user
  has_one :order, dependent: :destroy
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :Shipping_fee
  belongs_to :delivery_scheduled
  belongs_to :status
end
