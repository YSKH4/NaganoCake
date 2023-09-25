class Address < ApplicationRecord
  belongs_to :customer

  def full_address
    '〒' + zip_code + ' ' + shipping_address + ' ' + shipping_name
  end

  validates :zip_code, presence: true
  validates :shipping_address, presence: true
  validates :shipping_name, presence: true

end
