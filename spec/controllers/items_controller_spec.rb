require 'rails_helper'
describe ItemsController do
  describe "GET #new" do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do

    it "should increment the item count" do
      expect do
        post :create, params:{
          name: "abc",
          description: "aaaaaaaaaaa",
          category_id: "1",
          brand_id: "1",
          item_condition_id: "1",
          delivery_cost_id: "1",
          seller_region_id: "1",
          preparation_for_shipment_id: "1",
          price: "900000",
          image_url: "aad",
          seller_id: "1",
          user_id: "1",
          status_id: "1",
        }
      end.to change(Item, :count).by(1)
    end

    it "redirects to items#new" do
      post :create, params
      expect(response).to redirect_to(new_item_path)
    end
  end
end
