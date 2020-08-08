require 'rails_helper'
describe Item do
  
  describe '#create' do
    it "is valid with a name, description, price, category_id, item_condition_id, delivery_cost_id, seller_region_id, preparation_for_shipment_id, image_ids" do
      item = build(:item)
      expect(item).to be_valid
    end
    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end
    it "is invalid without a description" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end
    it "is invalid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end
    it "is invalid without a category" do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include("can't be blank")
    end
    it "is invalid without a item_condition" do
      item = build(:item, item_condition: nil)
      item.valid?
      expect(item.errors[:item_condition]).to include("can't be blank")
    end
    it "is invalid without a delivery_cost" do
      item = build(:item, delivery_cost: nil)
      item.valid?
      expect(item.errors[:delivery_cost]).to include("can't be blank")
    end
    it "is invalid without a seller_region" do
      item = build(:item, seller_region: nil)
      item.valid?
      expect(item.errors[:seller_region]).to include("can't be blank")
    end
    it "is invalid without a preparation_for_shipment" do
      item = build(:item, preparation_for_shipment: nil)
      item.valid?
      expect(item.errors[:preparation_for_shipment]).to include("can't be blank")
    end
    it "is invalid with a name which has more than 40 characters, try to 41 characters" do
      item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      item.valid?
      expect(item.errors[:name]).to include("is too long (maximum is 40 characters)")
    end
    it "is valid with a name which has less than 40 characters, try to 40 characters" do
      item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      item.valid?
      expect(item.errors[:name]).to be_valid
    end
    it "is invalid with a name which has more than 1000 characters" do
      item = build(:item, description: "a"*1001)
      item.valid?
      expect(item.errors[:description]).to include("is too long (maximum is 1000 characters)")
    end
    it "is valid with a name which has less than 1000 characters" do
      item = build(:item, description: "a"*1000)
      item.valid?
      expect(item.errors[:description]).to be_valid
    end
    it "is invalid without an image_ids" do
      item = build(:item, image_ids: nil)
      item.valid?
      expect(item.errors[:image_ids]).to include("can't be blank")
    end
  end
end
