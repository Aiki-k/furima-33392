class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :how_item, :category_id, :status_id, :delivery_fee_id, :delivery_area_id, :send_day_id,
                                 :fee, :image).merge(user_id: current_user.id)
  end
end
