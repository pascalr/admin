class CreateSpendings < ActiveRecord::Migration[6.0]
  def change
    create_table :spendings do |t|
      t.string :description
      t.float :cost
      t.date :day

      t.timestamps
    end
  end
end
