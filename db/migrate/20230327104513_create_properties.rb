class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :property_name,
      t.string :property_type,
      t.string :description,
      t.string :floors,
      t.string :facility_quality,
      t.string :bathroom,
      t.string :free_from,
      t.string :garage,
      t.string :parking_spaces

      t.timestamps
    end
  end
end
