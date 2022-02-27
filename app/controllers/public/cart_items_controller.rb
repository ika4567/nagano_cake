class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @total_price = 0
  end

  def update
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    CartItem.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.item_id.destroy_all
    redirect_to cart_items_path
  end

  def create
    if Item.find_by(:name)
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
