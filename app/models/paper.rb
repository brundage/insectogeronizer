# == Schema Information
#
# Table name: papers
#
#  id           :integer          not null, primary key
#  journal_id   :integer          not null
#  page_end     :integer          not null
#  page_start   :integer          not null
#  published_on :date             not null
#  title        :string(255)      not null
#  volume       :string(255)      not null
#

class Paper < ActiveRecord::Base

  attr_accessible :authors_attributes, :journal_name, :journal_id,
                  :locations_attributes, :page_end, :page_start, :published_on,
                  :title, :volume

  attr_accessor :journal_name

  belongs_to :journal, inverse_of: :papers

  has_and_belongs_to_many :authors
  accepts_nested_attributes_for :authors

  has_many :locations, as: :locatable
  accepts_nested_attributes_for :locations

  has_many :paper_results, dependent: :destroy, inverse_of: :paper

  validates :journal, presence: true
  validates :page_end, presence: true, numericality: { only_integer: true }
  validates :page_start, presence: true, numericality: { only_integer: true }
  validates :published_on, presence: true
  validates :title, presence: true
  validates :volume, presence: true

end
