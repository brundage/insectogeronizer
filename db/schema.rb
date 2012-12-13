# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121213043656) do

  create_table "authors", :force => true do |t|
    t.string "name", :null => false
  end

  add_index "authors", ["name"], :name => "index_authors_on_name"

  create_table "authors_papers", :id => false, :force => true do |t|
    t.integer "author_id", :null => false
    t.integer "paper_id",  :null => false
  end

  add_index "authors_papers", ["author_id"], :name => "index_authors_papers_on_author_id"
  add_index "authors_papers", ["paper_id"], :name => "index_authors_papers_on_paper_id"

  create_table "development_stages", :force => true do |t|
    t.string  "name",                     :null => false
    t.integer "insect_id",                :null => false
    t.integer "position",  :default => 1, :null => false
  end

  add_index "development_stages", ["insect_id"], :name => "index_development_stages_on_insect_id"

  create_table "insects", :force => true do |t|
    t.string "scientific_name", :null => false
    t.string "common_name",     :null => false
  end

  add_index "insects", ["common_name"], :name => "index_insects_on_common_name"
  add_index "insects", ["scientific_name"], :name => "index_insects_on_scientific_name", :unique => true

  create_table "journals", :force => true do |t|
    t.string "name", :null => false
  end

  add_index "journals", ["name"], :name => "index_journals_on_name"

  create_table "locations", :force => true do |t|
    t.string  "address"
    t.float   "latitude"
    t.integer "locatable_id"
    t.string  "locatable_type"
    t.float   "longitude"
    t.string  "name"
  end

  add_index "locations", ["locatable_type", "locatable_id"], :name => "index_locations_on_locatable_type_and_locatable_id"

  create_table "paper_results", :force => true do |t|
    t.integer "development_stage_id", :null => false
    t.float   "hours_high"
    t.float   "hours_low"
    t.float   "hours_mean"
    t.integer "paper_id",             :null => false
    t.float   "standard_deviation"
    t.float   "temperature",          :null => false
  end

  add_index "paper_results", ["development_stage_id"], :name => "index_paper_results_on_development_stage_id"
  add_index "paper_results", ["paper_id"], :name => "index_paper_results_on_paper_id"

  create_table "papers", :force => true do |t|
    t.integer "journal_id",   :null => false
    t.integer "page_end",     :null => false
    t.integer "page_start",   :null => false
    t.date    "published_on", :null => false
    t.string  "title",        :null => false
    t.string  "volume",       :null => false
  end

  add_index "papers", ["journal_id"], :name => "index_papers_on_journal_id"
  add_index "papers", ["title"], :name => "index_papers_on_title"

end
