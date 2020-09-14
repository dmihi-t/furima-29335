class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @item = Item.find(params[:item_id])
    # @order = @item.order
    redirect_to root_path if current_user.id == @item.user_id
  end
  
  def create
  end

end