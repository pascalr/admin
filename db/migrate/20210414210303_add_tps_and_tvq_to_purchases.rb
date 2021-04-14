class AddTpsAndTvqToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :tps, :float
    add_column :purchases, :tvq, :float
  end
end
