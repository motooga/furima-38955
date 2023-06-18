class Address < ApplicationRecord
  belongs_to :order

  validates :postal_code, presence: true
  validates :item_shipping_fee_status, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true }
  validates :birth_date, presence: true
  validates :order, presence: true
end
