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
    @image = Item.includes(:images).order("created_at DESC")
  end
  
  def create
    @item = Item.new(item_params)
    @brand = Brand.new(brand_params)
    if @item.save
      redirect_to items_path, notice: "出品が完了しました"
    else
      @item = Item.new(item_params)
      flash.now[:alert] = "no"
      redirect_to new_item_path, alert: "必須項目は全て入力してください"
    end
  end
  
  def update
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
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
