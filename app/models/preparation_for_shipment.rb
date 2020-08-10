class PreparationForShipment < ActiveHash::Base
  include ActiveHash::Associations
  field :day
  add id: 0, day: "選択してください"
  add id: 1, day: "1~2日で発送"
  add id: 2, day: "2~3日で発送"
  add id: 3, day: "4~7日で発送"
end