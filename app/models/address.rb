class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :family_name, :given_name, :family_name_kana, :given_name_kana, :postal_code, :prefecture, :city, :house_number, presence: true
  validates :phone_number, uniqueness: true
end
