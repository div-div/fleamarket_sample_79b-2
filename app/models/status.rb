class Status < ActiveHash::Base
  include ActiveHash::Associations
  field :status
  add id: 1, status: "出品中"
  add id: 2, status: "売却済み"
end
