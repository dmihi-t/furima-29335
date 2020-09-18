class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    redirect_to root_path if @item.order.presence
    redirect_to root_path if current_user.id == @item.user_id
    @order = OrderShipping.new
  end

  def create
    @order = OrderShipping.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    @item = Item.find(params[:item_id])
    params.require(:order_shipping).permit(:postal_code, :prefecture_id, :city, :address, :phone_number, :building_name).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    @item = Item.find(params[:item_id])
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
