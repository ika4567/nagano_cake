class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_item_path(item.id)
  end

  def show
    @item = Item.find(params[:id])
    #ジャンル名
    @genre_id = @item.genre.name
    # 税込価格
    @taxin = (@item.price*1.10).round(0)
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item.id)
  end


  private
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :genre_id)
  end

end
