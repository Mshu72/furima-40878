class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,         presence: true
  validates :first_name,       presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龠々]+\z/ }
  validates :last_name,        presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龠々]+\z/ }
  validates :first_name_kana,  presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龠々]+\z/, message: 'はカタカナで入力してください。' }
  validates :last_name_kana,   presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龠々]+\z/, message: 'はカタカナで入力してください。' }
  validates :birthday,         presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  has_many :items 
  has_many :orders
end
