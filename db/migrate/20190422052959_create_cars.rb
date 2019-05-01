class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string      :name
      t.string      :document
      t.string      :plate
      t.timestamps
    end
      add_index :cars, :document, unique: true
  end
end
