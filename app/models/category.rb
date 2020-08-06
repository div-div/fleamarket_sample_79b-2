class Category < ActiveHash::Base
  include ActiveHash::Associations
  field :category
  add id: 0, category: "選択してください"
  add id: 1, category: "レディース"
  add id: 2, category: "メンズ"
  add id: 3, category: "ベビー・キッズ"
  add id: 4, category: "インテリア・住まい・小物"
  add id: 5, category: "本・音楽・ゲーム"
  add id: 6, category: "おもちゃ・ホビー・グッズ"
  add id: 7, category: "コスメ・香水・美容"
  add id: 8, category: "家電・スマホ・カメラ"
  add id: 9, category: "スポーツ・レジャー"
  add id: 10, category: "ハンドメイド"
  add id: 11, category: "チケット"
  add id: 12, category: "自動車・オートバイ"
  add id: 13, category: "その他"
end
