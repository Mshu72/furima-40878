class Order < ApplicationRecord
  attr_accessor :token

  belongs_to :user
  belongs_to :items
  has_one :receiver
end