require 'rails_helper'
describe Item do
  describe '#create' do
    it "is invalid with a name, description, price, category_id, item_condition_id, delivery_cost_id, seller_region_id, preparation_for_shipment_id, image_ids" do
      item = build(:item)
      expect(item).to be_valid
    end
    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.error[:name]).to include("can't be blank")
    end
    it "is invalid without a description" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.error[:description]).to include("can't be blank")
    end

  end
end
#     validates :name, length: { maximum: 40 }
#     validates :description, length: { maximum: 1000 }
#     validates :price
#     validates :category_id
#     validates :item_condition_id
#     validates :delivery_cost_id
#     validates :seller_region_id
#     validates :preparation_for_shipment_id
#     validates :image_ids, length: { maximum: 10 }