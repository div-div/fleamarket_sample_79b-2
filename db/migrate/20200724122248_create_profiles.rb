class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :family_name,             null: false
      t.string :given_name,               null: false
      t.string :family_name_kana,         null: false
      t.string :given_name_kana,          null: false
      t.integer :birth_date_year,         null: false
      t.integer :birth_date_month,        null: false
      t.integer :birth_date_day,         null: false
      t.references :user,                  foreign_key: true
      t.timestamps
    end
  end
end
