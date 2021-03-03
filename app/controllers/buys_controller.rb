class BuysController < ApplicationController
  def index
    @buy_address = BuyAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buy_address = BuyAddress.new(buy_address_params)
    @item = Item.find(params[:item_id])
    
    if @buy_address.valid?
      @buy_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def buy_address_params
    params.permit(:postal_code, :shipping_area_id, :municipality, :address, :building, :phone, :user_id, :item_id)
  end

end
