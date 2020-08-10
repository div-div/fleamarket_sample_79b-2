class ItemsController < ApplicationController
  def index
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
      redirect_to new_item_path, notice: "出品が完了しました"
      # redirect_to root_path, notice: "出品が完了しました"
    else
      @item = Item.new(item_params)
      flash.now[:alert] = "no"
      redirect_to new_item_path, alert: "必須項目は全て入力してください"
    end
  end

  def update
    if @item.upload(item_params)
      # redirect_to root_path, notice: "更新しました"
      redirect_to new_item_path, notice: "更新しました"
    else
      @item = Item.new(item_params)
      # flash.now[:alert] = "no"
      redirect_to new_item_path, alert: "更新に失敗しました"
    end
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :brand_id, :item_condition_id, :delivery_cost_id, :seller_region_id, :preparation_for_shipment_id, :price, images_attributes: [:image_url, :_destroy, :id]).merge(seller_id: current_user.id, user_id: current_user.id, status_id:1)
  end

  def brand_params
    params.require(:item).permit(:brand_name)
  end
end
