class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
<<<<<<< HEAD
  #税込を求めるメソッド
  def  add_tax_price
   (price * 1.1).floor
  end
  #小計を求めるメソッド
  def subtotal
   item.with_tax_price * amount
  end
  
  attribute :last_name, :string
  attribute :first_name, :string
  #フルネーム
  def full_name
    "#{last_name}#{first_name}"
  end
  #宛先全ての情報
  def full_address
    "#{zip_code}#{shipping_address}#{shipping_name}"
  end
  
  #enum
  enum payment_method: { transfer: 0, credit_card: 1 }
  enum status: {unpaid: 1, payment_check: 2, in_production: 3, preparing_to_ship: 4, shipped: 5 }
  # enum making_status: { untouched: 0, waiting_for_production: 1, in_production: 2, production_completed: 3 }
  
  #支払方法
  def payment_method_text
     if payment_method == 0
      Order.payment_methods_i18n[:credit_card]
     else
      Order.payment_methods_i18n[:transfer]
     end
  end
     
=======
  
   #支払い方法
  enum payment_method: { transfer: 0, credit_card: 1}
  #注文ステータス
  enum order_status: {wait_payment: 0, confirm_payment: 1, making: 2, preparing_ship: 3, finish_prepare: 4}
>>>>>>> origin/develop

end
