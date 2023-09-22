class OrderDetail < ApplicationRecord
   belongs_to :order
  belongs_to :item
  
  enum making_status: { not_production: 0, waiting_for_production: 1, in_production: 2, production_completed: 3 }
  

 #小計を求めるメソッド
 def subtotal
  unit_price * amount
 end
  

#   enum manufacture_status:
#         {
#           impossible_manufacture:0,
#           waiting_manufacture:1,
#           manufacturing:2,
#           finish:3
#         }
        
end
