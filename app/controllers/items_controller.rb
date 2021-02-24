class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_item, only: [:show, :edit, :update]
  def index
    @items = Item.order('created_at DESC')
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

  def show
  end

  def edit
    unless @item.user == current_user
    redirect_to action: :index 
    end
  end 

  def update
    unless @item.user == current_user
      redirect_to action: :index 
    end
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:product, :explanation, :category_id, :condition_id, :shipping_charge_id, :shipping_area_id,
                                 :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
