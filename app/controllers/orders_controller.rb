class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to controller: 'items', action: 'index'
    else
      @item = Item.find(params[:item_id])
      render('orders/index')
    end
  end

  private

  def order_params
    params.permit(:postal_code, :delivery_area_id, :j_sityoson, :j_banti, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id])
  end
end