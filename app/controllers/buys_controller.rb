class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :redirect_root, only: [:index, :create]
  def index
    @buy_address = BuyAddress.new
  end

  def create
    @buy_address = BuyAddress.new(buy_address_params)
    if @buy_address.valid?
      pay_buy
      @buy_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buy_address_params
    params.require(:buy_address).permit(:postal_code, :shipping_area_id, :municipality, :address, :building, :phone).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_buy
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price], # 商品の値段
      card: buy_address_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_root
    redirect_to root_path if current_user == @item.user || @item.buy.present?
  end
end
