class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.float :quantity
      t.float :price
      t.date :day
      t.references :part, null: false, foreign_key: true
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
