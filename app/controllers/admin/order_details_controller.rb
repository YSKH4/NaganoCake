class Admin::OrderDetailsController < ApplicationController
  
#   def update 
#     @order_detail = OrderDetail.find(params[:id])
#     # @order = @order_detail.order
#     @order = Order.find(params[:order_id])
#     @order_details = @order.order_details.all
    
#   is_updated = true
#     if @order_detail.update(order_detail_params)
#       @order.update(status: "制作中") if @order_detail.making_status == "制作中"
#       # ②製作ステータスが「製作中」のときに、注文ステータスを「製作中」に更新する。
#       @order_details.each do |order_detail|  # ③紐付いている注文商品の製作ステータスが "すべて" [製作完了]になった際に注文ステータスを「発送準備中」に更新
#           if order_detail.making_status != "制作完了"　#紐付いている注文商品の製作ステータスを一つ一つeach文で確認
#           # 製作ステータスが「製作完了」ではない場合
#             is_updated = false 　# 上記で定義してあるis_updatedを「false」に変更する。
#           end
#       end
#       @order.update(status: "発送準備中") if is_updated　# is_updatedがtrueの場合に、注文ステータスが「発送準備中」に更新されます。上記のif文でis_updatedがfalseになっている場合、更新されません。
#     end
#       redirect_to admin_order_path(@order)
# end

#   private

#   def order_detail_params
#     params.require(:order_detail).permit(:making_status, )
#   end

def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all
    
    if @order_detail.update(order_detail_params)
      @order.update_status_on_order_detail_change
      redirect_to admin_order_path(@order)
    else
      render :show
    end
  end
  
  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
  
end