class CreateFurnishings < ActiveRecord::Migration[7.0]
  def change
    create_table :furnishings do |t|
      t.references :property, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
