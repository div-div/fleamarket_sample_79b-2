class ItemsController < ApplicationController
  before_action :set_item, only: [:show]
  
  def index
    @new_items = Item.where(status_id: 1).order(id: "DESC").limit(5)
  end

  def show
   
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
    if @item.save
      redirect_to item_path(@item.id), notice: "ok"
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
  
  def set_item
    @item = Item.find(params[:id])
  end

  def brand_params
    params.require(:item).permit(:brand_name)  
  end
end
