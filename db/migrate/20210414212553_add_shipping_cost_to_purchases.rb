class AddShippingCostToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :shipping_cost, :float
  end
end
