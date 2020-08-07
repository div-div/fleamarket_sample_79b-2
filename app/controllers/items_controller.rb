class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @brand = Brand.new
    @item.images.new
    # @items = Item.includes(:images)
  end

  def create
    @item = Item.new(item_params)
    @brand = Brand.new(brand_params)
    # binding.pry
    if @item.save
      redirect_to new_item_path, notice: "ok"
    else
      # flash.now[:alert] = "no"
      redirect_to new_item_path, alert: "no"
      # render :new
    end
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :brand_id, :item_condition_id, :delivery_cost_id, :seller_region_id, :preparation_for_shipment_id, :price, images_attributes: [:image_url]).merge(seller_id: current_user.id, user_id: current_user.id, status_id:1)
  end

  def brand_params
    params.require(:item).permit(:brand_name)
  end
end
