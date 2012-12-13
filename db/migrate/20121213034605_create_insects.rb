class CreateInsects < ActiveRecord::Migration
  def change
    create_table :insects do |t|
      t.string :scientific_name, null: false
      t.string :common_name, null: false
    end
    add_index :insects, :common_name
    add_index :insects, :scientific_name, unique: true
  end
end
