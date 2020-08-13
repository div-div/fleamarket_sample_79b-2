class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @brand = Brand.new
    @item.build_brand
    @item.images.new
    @image = Item.includes(:images).order("created_at DESC")
  end

  def create
    @item = Item.new(item_params)
    @brand = Brand.new(brand_params)

    if @item.save
      redirect_to new_item_path, notice: "出品が完了しました"
    elsif @item.images.length > 10 || @item.images.length == 0
      redirect_to new_item_path, alert: "画像は1~10枚にしてください"
    elsif @item.name.length == 0 || @item.name.length > 40
      flash.now[:alert] = "名前は1~40文字で入力してください"
      render action: :new
    elsif @item.description.length == 0 || @item.description.length > 1000
      flash.now[:alert] = "商品説明は1~1000文字で入力してください"
      render action: :new
    else
      flash.now[:alert] = "必須項目は全て入力してください"
      render action: :new
    end
  end

  def update
    @item = Item.find(params[:id])
    @image = Image.find(params[:id])

    if @item.update(item_params) && @item.user_id == current_user.id
      redirect_to "/items/11/edit", notice: "更新しました"
    elsif @item.images.length > 10 || @item.images.length == 0
      redirect_to edit_item_path, alert: "画像は1~10枚にしてください"
    elsif @item.name.length == 0 || @item.name.length > 40
      flash.now[:alert] = "名前は1~40文字で入力してください"
      render action: :edit
    elsif @item.description.length == 0 || @item.description.length > 1000
      flash.now[:alert] = "商品説明は1~1000文字で入力してください"
      render action: :edit
    else
      flash.now[:alert] = "必須項目は全て入力してください"
      render action: :edit
    end
  end

  def edit
    @item = Item.find(params[:id])
    @item.images.build
    @brand = Brand.new
    @item.build_brand
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :brand_id, :item_condition_id, :delivery_cost_id, :seller_region_id, :preparation_for_shipment_id, :price, images_attributes: [:image_url, :_destroy, :id], brand_attributes:[:brand_name, :id]).merge(seller_id: current_user.id, user_id: current_user.id, status_id:1)
  end

  def brand_params
    params.require(:item).permit(:brand_name)
  end
end
