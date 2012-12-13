class Paper < ActiveRecord::Base

  attr_accessible :authors_attributes, :journal, :locations_attributes,
                  :page_end, :page_start, :published_on, :title, :volume

  belongs_to :journal, inverse_of: :papers

  has_and_belongs_to_many :authors
  accepts_nested_attributes_for :authors

  has_many :locations, as: :locatable
  accepts_nested_attributes_for :locations

  has_many :paper_results, dependent: :destroy, inverse_of: :paper

  validates :journal, presence: true
  validates :page_end, presence: true
  validates :page_start, presence: true
  validates :published_on, presence: true
  validates :title, presence: true
  validates :volume, presence: true

end
