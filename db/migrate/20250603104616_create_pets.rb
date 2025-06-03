class CreatePets < ActiveRecord::Migration[7.1]
  def change
    create_table :pets do |t|
      t.string :species
      t.string :name
      t.integer :price
      t.string :location
      t.boolean :availability

      t.timestamps
    end
  end
end
