class Profile < ApplicationRecord
  belongs_to :user, optional: true
  validates :family_name, :given_name, :family_name_kana, :given_name_kana, :birth_date_year, :birth_date_month, :birth_date_day, presence: true
end
