class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index]
  def index
    @items = Item.all
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

  private

  def item_params
    params.require(:item)
          .permit(:image, :name, :explanation, :category_id, :item_status_id,
                  :shipping_fee_status_id, :area_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end
end
# def move_to_index
#   unless user_signed_in?
#     redirect_to action: :index
#   end
# end
