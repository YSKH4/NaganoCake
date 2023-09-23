class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details

  end
  
  # def update
  #   @order = Order.find(params[:id])
  #   @order_details = @order.order_details
  #   if @order.update(order_params)
  #     @order_details.update_all(making_status: "制作待ち") if @order.status == "入金確認"
  #       ## ①注文ステータスが「入金確認」とき、製作ステータスを全て「製作待ち」に更新する
  #   end
  #     redirect_to admin_order_path(@order)
  # end
  
  # def order_params
  #   params.require(:order).permit(:status)
  # end
  
  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details

    if @order.update(order_params)
      if @order_details.all? { |detail| detail.making_status == '制作完了' }
        @order.update(status: '発送準備中')
      elsif @order_details.any? { |detail| detail.making_status == '制作中' }
        @order.update(status: '制作中')
      end
      redirect_to admin_order_path(@order)
    else
      render :show
    end
  end
  
  private

  def order_params
    params.require(:order).permit(:status)
  end
  
end
