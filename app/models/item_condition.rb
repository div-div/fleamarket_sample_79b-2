class ItemCondition < ActiveHash::Base
  include ActiveHash::Associations
  field :condition
  add id: 0, condition: "選択してください"
  add id: 1, condition: "新品、未使用"
  add id: 2, condition: "未使用に近い"
  add id: 3, condition: "目立った傷や汚れなし"
  add id: 4, condition: "やや傷や汚れあり"
  add id: 5, condition: "傷や汚れあり"
  add id: 6, condition: "全体的に状態が悪い"
end
