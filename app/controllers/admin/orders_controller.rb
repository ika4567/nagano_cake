class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_detail = Order_detail.all 
    @total_price = 0
  end

  def update
  end
end
