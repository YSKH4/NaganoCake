class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  
  enum making_status: { not_production: 0, waiting_for_production: 1, in_production: 2, production_completed: 3 }
  

  #小計を求めるメソッド
  def subtotal
   unit_price * amount
  end
  
  
  
end
