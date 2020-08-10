class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :image_url,     null: false
      t.references :item,      foreign_key: true, null: false
      t.timestamps
    end
  end
end
