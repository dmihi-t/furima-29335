class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
    @order = OrderShipping.new
  end
  
  def create
    @order = OrderShipping.new(order_params)
    if @order.valid?
      @item = Item.find(params[:item_id])
      pay_item
      @order.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'index'
    end
  end

  private

  def order_params
    @item = Item.find(params[:item_id])
    params.require(:order_shipping).permit(:postal_code, :prefecture_id, :city, :address, :phone_number, :building_name).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    @item = Item.find(params[:item_id])
    Payjp::Charge.create(
      amount: @item.price, 
      card: params[:token],
      currency:'jpy'
    )
  end

end