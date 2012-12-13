class CreatePaperResults < ActiveRecord::Migration
  def change
    create_table :paper_results do |t|
      t.references :development_stage, null: false
      t.float :hours_high
      t.float :hours_low
      t.float :hours_mean
      t.references :paper, null: false
      t.float :standard_deviation
      t.float :temperature, null: false
    end
    add_index :paper_results, :development_stage_id
    add_index :paper_results, :paper_id
  end
end
