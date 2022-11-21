class CreateGrandparents < ActiveRecord::Migration[7.0]
  def change
    create_table :grandparents do |t|
      t.string :name
      t.text :description
      t.integer :age
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
