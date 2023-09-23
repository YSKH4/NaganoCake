class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details

  end
  
  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    
    if @order.update(order_params)
      if @order.status == "payment_check"
        @order_details.update_all(making_status: 1)
      end
    redirect_to admin_order_path(@order)
    end
  end
  
  
  private

  def order_params
    params.require(:order).permit(:status)
  end
  
  
  #   @order = Order.find(params[:id])
  #   # @order_details = @order.order_details
  #   @order.update(order_params)
  #   if @order.status == "payment_check"
  #     OrderDetail.where(order_id: @order.id).update_all(making_status: "waiting_for_production") 
  #       ## ①注文ステータスが「入金確認」とき、製作ステータスを全て「製作待ち」に更新する
  #   end 
  #     redirect_to admin_order_path(@order)
  # end
  
  # def order_params
  #   params.require(:order).permit(:status)
  # end
  
  # # def update
  # #   @order = Order.find(params[:id])
  # #   @order_details = @order.order_details

  # #   if @order.update(order_params)
  # #     if @order_details.all? { |detail| detail.making_status == '制作完了' }
  # #       @order.update(status: '発送準備中')
  # #     elsif @order_details.any? { |detail| detail.making_status == '制作中' }
  # #       @order.update(status: '制作中')
  # #     end
  # #     redirect_to admin_order_path(@order)
  # #   else
  # #     render :show
  # #   end
  # # end
  
  # # private

  # # def order_params
  # #   params.require(:order).permit(:status)
  # # end
  
end
