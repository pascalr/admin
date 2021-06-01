class CreateBills < ActiveRecord::Migration[6.0]
  def change
    create_table :bills do |t|
      t.date :day
      t.references :supplier, null: false, foreign_key: true
      t.float :shipping_cost
      t.boolean :items_received

      t.timestamps
    end
  end
end
