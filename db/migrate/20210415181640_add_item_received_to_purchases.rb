class AddItemReceivedToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :item_received, :boolean
  end
end
