class CreateShoppingItems < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_items do |t|
      t.integer :supplier_id
      t.string :title
      t.string :comment
      t.float :quantity

      t.timestamps
    end
  end
end
