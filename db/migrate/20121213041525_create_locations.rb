class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.float :latitude
      t.references :locatable, null: false
      t.string :locatable_type, null: false
      t.float :longitude
      t.string :name, null: false
    end
    add_index :locations, [:locatable_type, :locatable_id]
  end
end
