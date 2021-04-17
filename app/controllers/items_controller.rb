class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_paramas, only: [:edit, :update, :show]
  before_action :edit_updete,only: [:edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render 'edit'
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :how_item, :category_id, :status_id, :delivery_fee_id, :delivery_area_id, :send_day_id,
                                 :fee, :image).merge(user_id: current_user.id)
  end


  def find_paramas
    @item = Item.find(params[:id])
  end

  def edit_updete
    if current_user.id != @item.user.id
      redirect_to root_path
    end
  end

end
