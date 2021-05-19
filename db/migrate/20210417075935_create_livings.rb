class CreateLivings < ActiveRecord::Migration[6.0]
  def change
    create_table :livings do |t|
      t.string :postal_code,null: false
      t.integer :delivery_area_id, null: false
      t.string :j_sityoson, null: false
      t.string :j_banti, null: false
      t.string :building
      t.string :phone_number, null: false
      t.references :buy_item, foreign_key: true
      t.timestamps
    end
  end
end