class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
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

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(:image,:name,:description,:category_id,:status_id,:delivery_fee_id,:prefecture_id,:days_shipping_id,:price)
  end
  
end
