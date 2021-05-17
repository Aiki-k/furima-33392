class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :index_params

  def index
      @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      set_item
      render('orders/index')
    end
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :delivery_area_id, :j_sityoson, :j_banti, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: set_item.fee,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def index_params
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
    if @item.buy_item.present?
      redirect_to root_path
    end
  end
end