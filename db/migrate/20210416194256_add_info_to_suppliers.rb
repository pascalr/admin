class AddInfoToSuppliers < ActiveRecord::Migration[6.0]
  def change
    add_column :suppliers, :phone_number, :string
    add_column :suppliers, :email, :string
    add_column :suppliers, :contact_name, :string
    add_column :suppliers, :website, :string
  end
end
