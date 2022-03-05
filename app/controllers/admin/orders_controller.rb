class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_detail = @order.order_details.all
    @total_price = 0
  end

  def update
  end
end
