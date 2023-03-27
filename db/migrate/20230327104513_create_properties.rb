class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :property_name
      t.string :property_type
      t.text :description
      t.integer :floors
      t.string :facility_quality
      t.integer :bathrooms
      t.boolean :garage
      t.integer :parking_spaces

      t.timestamps
    end
  end
end
