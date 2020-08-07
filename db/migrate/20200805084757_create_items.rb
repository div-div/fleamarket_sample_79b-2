class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                                null: false
      t.text :description,                          null: false
      t.integer :price,                             null: false
      # t.references :buyer,                      foreign_key: true
      # t.references :seller,                     foreign_key: true, null: false
      # t.references :category,                   foreign_key: true, null: false
      # t.references :brand,                      foreign_key: true
      # t.references :item_condition,             foreign_key: true, null: false
      # t.references :delivery_cost_payer,         foreign_key: true, null: false
      # t.references :seller_region,              foreign_key: true, null: false
      # t.references :preparation_for_shipment,    foreign_key: true, null: false
      # t.references :status,                      foreign_key: true, null: false
      t.timestamps
    end
  end
end
