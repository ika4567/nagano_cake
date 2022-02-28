class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @total_price = 0
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    CartItem.destroy(params[:id])
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items = current_customer.cart_items.all
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    if current_customer.cart_items.find_by(item_id: params[:item_id]).present?
      @add_amount = current_customer.cart_items.find_by(item_id: params[:item_id])
      @add_amount.amount += params[:amount].to_i
      @add_amount.update(amount: params[:amount])
      redirect_to cart_items_path
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save
      redirect_to cart_items_path
    end

  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
