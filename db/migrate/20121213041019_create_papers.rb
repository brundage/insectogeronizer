class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.references :journal, null: false
      t.integer :page_end, null: false
      t.integer :page_start, null: false
      t.date :published_on, null: false
      t.string :title, null: false
      t.string :volume, null: false
    end
    add_index :papers, :journal_id
    add_index :papers, :title

    create_table :authors_papers, id: false do |t|
      t.references :author, null: false
      t.references :paper, null: false
    end
    add_index :authors_papers, :author_id
    add_index :authors_papers, :paper_id
  end
end
