class ItemsController < ApplicationController
  before_action :set_item
  
  def index
  end
  
  def show
  end
  
  private
  def set_item
    @item = Item.find(params[:item_id])
  end
end
