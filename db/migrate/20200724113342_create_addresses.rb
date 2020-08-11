class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :family_name,              null: false
      t.string :given_name,             null: false
      t.string :family_name_kana,         null: false
      t.string :given_name_kana,          null: false
      t.integer :postal_code,           null: false
      t.string :prefecture,              null: false
      t.string :city,                    null: false
      t.string :house_number,            null: false
      t.string :building_name
      t.string :phone_number,           unique: false
      t.references :user,              foreign_key: true
      t.timestamps
    end
  end
end
