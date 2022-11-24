class AddCoordinatesToGrandparents < ActiveRecord::Migration[7.0]
  def change
    add_column :grandparents, :latitude, :float
    add_column :grandparents, :longitude, :float
  end
end
