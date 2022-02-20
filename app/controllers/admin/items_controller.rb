class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    # @items = Item.page(params[:page])
  end

  def new
    @new = Item.new
    # @genre = Genre.id
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_items_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end


  private
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price)
  end

end
