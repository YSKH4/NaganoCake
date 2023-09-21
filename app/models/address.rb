class Address < ApplicationRecord
  belongs_to :customer
  
  def full_address
    '〒' + zip_code + ' ' + shipping_address + ' ' + shipping_name
  end
  
  
end
