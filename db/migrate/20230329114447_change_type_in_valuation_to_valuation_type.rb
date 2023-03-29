class ChangeTypeInValuationToValuationType < ActiveRecord::Migration[7.0]
  def change
    rename_column :valuations, :type, :valuation_type
  end
end
