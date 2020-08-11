class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.bigint :buyer, foreign_key: { to_table: :users }
      t.bigint :seller, foreign_key: { to_table: :users }, null: false
      t.references :category
      t.references :brand, foreign_key: true
      t.references :item_condition, null: false
      t.references :delivery_cost, null: false
      t.references :seller_region, null: false
      t.references :preparation_for_shipment, null:false
      t.references :status, null: false
      t.references :user, foreign_key: true
      t.timestamp :deal_ending_day
      t.timestamps
    end
  end
end

