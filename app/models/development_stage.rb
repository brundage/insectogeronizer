class DevelopmentStage < ActiveRecord::Base

  attr_accessible :insect, :name, :position

  belongs_to :insect, inverse_of: :development_stages

  has_many :paper_results, dependent: :destroy, inverse_of: :development_stage

  validates :insect, presence: true
  validates :name, presence: true
  validates :position, numericality: { greater_than: 0, only_integer: true },
                       presence: true

end
