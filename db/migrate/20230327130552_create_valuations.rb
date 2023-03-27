class CreateValuations < ActiveRecord::Migration[7.0]
  def change
    create_table :valuations do |t|
      t.references :property, null: false, foreign_key: true
      t.string :type
      t.decimal :value, precision: 10, scale: 2
      t.date :valuation_date

      t.timestamps
    end
  end
end
