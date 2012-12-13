class CreateDevelopmentStages < ActiveRecord::Migration
  def change
    create_table :development_stages do |t|
      t.string :name, null: false
      t.references :insect, null: false
      t.integer :position, null: false, default: 1
    end
    add_index :development_stages, :insect_id
  end
end
