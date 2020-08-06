class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.images.new
    # @items = Item.includes(:images)
  end

  def create
    @item = Item.new(item_params)
    @brand = Brand.new(brand_params)
    # binding.pry
    if @item.save
      redirect_to root_path, notice: "ok"
    else
      # flash.now[:alert] = 'no'
      redirect_to root_path, notice: "no"
    end
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :brand_id, :item_condition_id, :delivery_cost_id, :seller_region_id, :preparation_for_shipment_id, :price)
  end

  def brand_params
    params.require(:item).permit(:brand_name)
  end
end
# , :images_attributes: [:src] , :description,  :condition_id :price, :deal_ending_day