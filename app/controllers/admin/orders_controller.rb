class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_detail = Order_detail.all
  end

  def update
  end
end
