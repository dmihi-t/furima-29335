class OrdersController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    # @order = @item.order
  end
  
  def create
  end

end