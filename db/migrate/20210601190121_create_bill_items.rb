class CreateBillItems < ActiveRecord::Migration[6.0]
  def change
    create_table :bill_items do |t|
      t.references :bill, null: false, foreign_key: true
      t.integer :part_id
      t.string :description
      t.float :quantity
      t.float :price
      t.float :tps
      t.float :tvq

      t.timestamps
    end
  end
end
