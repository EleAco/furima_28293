class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :purchase, only: [:show]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
    if @item.user == current_user
      render 'edit'
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item)
          .permit(:image, :name, :explanation, :category_id, :item_status_id,
                  :shipping_fee_status_id, :area_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  def purchase
    redirect_to root_path if @item.item_purchase.present?
  end
end
