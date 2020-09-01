class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    redirect_to root_path if @item.user == current_user
    @tokenbuy = TokenBuy.new
  end

  def create
    @tokenbuy = TokenBuy.new(tokenbuy_params)
    if @tokenbuy.valid?
      pay_item
      @tokenbuy.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def tokenbuy_params
    params.permit(:zip_code, :area_id, :city, :addoress, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
