class Item < ApplicationRecord
  validates :title,                  presence: true
  validates :detail,                 presence: true
  validates :price,                  presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image,                  presence: true
  validates :prefecture_id,          numericality: { other_than: 1 , message: "can't be blank"}
  validates :category_id,            numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_id,        numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_scheduled_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id,              numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefectures
  belongs_to :categories
  belongs_to :Shipping_fee
  belongs_to :delivery_scheduled
  belongs_to :status
end
