class AddAddressToGrandparents < ActiveRecord::Migration[7.0]
  def change
    add_column :grandparents, :address, :string
  end
end
