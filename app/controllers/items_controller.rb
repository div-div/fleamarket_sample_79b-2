class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :category]
  # before_action :set_category, only:[:category]
  
  def index
  end

  def show  
  end
  
  def new
    @item = Item.new
    @brand = Brand.new
    @item.images.new
    # @items = Item.includes(:images)
    
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent.name
    end       
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
  
  # 親カテゴリーが選択された後に呼び出されるアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children

  end

  # 子カテゴリーが選択された後に呼び出されるアクション
  def get_category_grandchildren
　  #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children
  end
  
  def category
    #商品詳細からカテゴリーの商品一覧へ飛ぶメソッドアクション
    @category_items = Item.where(category_id: params[:category_id])
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
