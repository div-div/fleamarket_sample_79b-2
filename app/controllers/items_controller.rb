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
      # redirect_to new_item_path, alert: "商品説明は1~1000文字で入力してください"
    # elsif @item.price == nil || @item.category_id == nil || @item.brand_id == nil || @item.item_condition_id == nil || delivery_cost_id == nil || seller_region_id == nil || preparation_for_shipment_id == nil
    #   redirect_to new_item_path, alert: "必須項目は全て入力してください"
    else
      # render action: :new, alert: "必須項目は全て入力してください"
      flash.now[:alert] = "必須項目は全て入力してください"
      render action: :new
    end
  end

  def update
    @item = Item.find(params[:id])
    @image = Image.find(params[:id])

    if @item.update(item_params) && @item.user_id == current_user.id
      # redirect_to root_path, notice: "更新しました"
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
      # render action: :new, alert: "必須項目は全て入力してください"
      flash.now[:alert] = "必須項目は全て入力してください"
      render action: :edit
    end
    # elsif @item.images.length > 10 || @item.images.length == 0
    #   redirect_to "/items/11/edit", alert: "画像は1~10枚にしてください"
    # elsif @item.name.length == 0 || @item.name.length > 40
    #   redirect_to "/items/11/edit", alert: "名前は1~40文字で入力してください"
    # elsif @item.description.length == 0 || @item.description.length > 1000
    #   redirect_to "/items/11/edit", alert: "商品説明は1~1000文字で入力してください"
    # else
    #   redirect_to "/items/11/edit", alert: "必須項目は全て入力してください"
    # end


    # if @item.update(item_params) && @item.user_id == current_user.id
    #   # redirect_to root_path, notice: "更新しました"
    #   redirect_to "/items/11/edit", notice: "更新しました"
    # else
    #   # flash.now[:alert] = "no"
    #   redirect_to "/items/11/edit", alert: "更新に失敗しました"
    # end
  end

  def edit
    @item = Item.find(params[:id])
    @item.images.build
    @brand = Brand.new
    @item.build_brand
    # @image = Item.includes(:images).order("created_at DESC")
    # binding.pry
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :brand_id, :item_condition_id, :delivery_cost_id, :seller_region_id, :preparation_for_shipment_id, :price, images_attributes: [:image_url, :_destroy, :id], brand_attributes:[:brand_name, :id]).merge(seller_id: current_user.id, user_id: current_user.id, status_id:1)
  end

  def brand_params
    params.require(:item).permit(:brand_name)
  end
end
