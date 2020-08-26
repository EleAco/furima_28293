class User < ApplicationRecord
  has_many :items
  has_many :item_purchases

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do |users|
    users.validates :nickname
    users.validates :email
    users.validates :password
    users.validates :encrypted_password
    users.validates :first_name
    users.validates :last_name
    users.validates :first_name_kana
    users.validates :last_name_kana
    users.validates :birthday
  end

  with_options format: { with: /\A[一-龥]+\z/ } do |name|
    name.validates :first_name
    name.validates :last_name
  end

  with_options format: { with: /\A([ァ-ン]|ー)+\z/ } do |kana|
    kana.validates :first_name_kana
    kana.validates :last_name_kana
  end

  PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/.freeze
  validates_format_of :password, with: PASSWORD_REGEX
end
