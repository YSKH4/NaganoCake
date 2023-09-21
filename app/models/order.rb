class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
   #支払い方法
  enum payment_method: { transfer: 0, credit_card: 1}
  #注文ステータス
  enum order_status: {wait_payment: 0, confirm_payment: 1, making: 2, preparing_ship: 3, finish_prepare: 4}

end
