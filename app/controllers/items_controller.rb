class ItemsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :item_name, :text, :price, :category_id, :condition_id, :shipping_id, :area_id, :day_id).merge(user_id: current_user.id)
  end

end
