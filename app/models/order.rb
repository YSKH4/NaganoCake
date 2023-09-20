class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  def  add_tax_price
   (item.price * 1.10).round
  end
  
  def sum_of_price
    item.taxin_price * quantity
  end
  
  def full_name_text
    "#{last_name}#{first_name}"
  end
  
  def full_address
    "#{zip_code}#{shipping_address}#{shipping_name}"
  end
  
  enum payment_method: { transfer: 0, credit_card: 1 }
  enum status: {unpaid: 1, payment_check: 2, in_production: 3, preparing_to_ship: 4, shipped: 5 }
  
  def payment_method_text
     if payment_method == 0
      Order.payment_methods_i18n[:credit_card]
     else
      Order.payment_methods_i18n[:transfer]
     end
  end
     

end
