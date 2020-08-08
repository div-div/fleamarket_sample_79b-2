FactoryBot.define do

  factory :item do
    name                          {"abc"}
    description                   {"aaaaaaaaaaa"}
    price                         {"900000"}
    category_id                   {"1"}
    item_condition_id             {"1"}
    delivery_cost_id              {"1"}
    seller_region_id              {"1"}
    preparation_for_shipment_id   {"1"}
    image_ids                     {"1"}
  end

end
