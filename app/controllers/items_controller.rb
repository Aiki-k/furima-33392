class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_params, only: [:edit, :update, :show, :destroy]
  before_action :edit_updete, only: [:edit, :update]
  before_action :edit_params, only: :edit

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
    edit_params
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

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :how_item, :category_id, :status_id, :delivery_fee_id, :delivery_area_id, :send_day_id,:fee, :image).merge(user_id: current_user.id)
  end

  def find_params
    @item = Item.find(params[:id])
  end

  def edit_updete
    redirect_to root_path if current_user.id != @item.user.id
  end

  def edit_params
    if @item.buy_item.present?
      redirect_to root_path
    end
  end
end