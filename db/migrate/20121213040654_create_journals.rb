class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.string :name, null: false
    end
    add_index :journals, :name
  end
end
