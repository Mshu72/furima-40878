class Order < ApplicationRecord
  attr_accessor :token

  validates :token, presence: true

  belongs_to :user
  belongs_to :items
  has_one :receiver
end