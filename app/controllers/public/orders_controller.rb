class Public::OrdersController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :new, :create, :confirm, :thanks, :show]

  def new
    @order = Order.new
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    cart_items = current_customer.cart_items.all
    cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.tax_price = cart_item.item.with_tax_price
      @order_detail.amount = cart_item.amount
    # binding.pry
      @order_detail.save
    end
    redirect_to thanks_path
    current_customer.cart_items.destroy_all
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      #binding.pry
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    # binding.pry
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end
    @cart_items = current_customer.cart_items.all
    @total_price = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @billing = @total_price + @order.postage
    render :confirm
  end

  def thanks
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
    @total_price = @order_details.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  # 削除する！！（routes.rb、show.html.erb）
  def destroy
    @order = Order.find(params[:id])
    Order.destroy(params[:id])
    redirect_to order_path
  end
  # ここまで

  private
  def order_params
    params.require(:order).permit(:payment, :postal_code, :address, :name, :billing)
  end

end
