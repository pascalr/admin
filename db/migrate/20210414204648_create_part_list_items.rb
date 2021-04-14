class CreatePartListItems < ActiveRecord::Migration[6.0]
  def change
    create_table :part_list_items do |t|
      t.integer :part_id
      t.integer :item_id
      t.float :quantity

      t.timestamps
    end
  end
end
