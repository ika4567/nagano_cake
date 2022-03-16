class Admin::OrdersController < ApplicationController
  before_action :authenticate_customer!, except: [:show, :update]
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_detail = @order.order_details.all
    @total_price = 0
  end

  def update
  end
end
