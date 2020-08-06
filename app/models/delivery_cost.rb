class DeliveryCost < ActiveHash::Base
  include ActiveHash::Associations
  field :deliveryCost
  add id: 0, deliveryCost: "選択してください"
  add id: 1, deliveryCost: "送料込み(出品者負担)"
  add id: 2, deliveryCost: "着払い(購入者負担)"
end
