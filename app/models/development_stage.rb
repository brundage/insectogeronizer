# == Schema Information
#
# Table name: development_stages
#
#  id        :integer          not null, primary key
#  name      :string(255)      not null
#  insect_id :integer          not null
#  position  :integer          default(1), not null
#

class DevelopmentStage < ActiveRecord::Base

  attr_accessible :insect, :name, :position

  belongs_to :insect, inverse_of: :development_stages

  has_many :paper_results, dependent: :destroy, inverse_of: :development_stage

  validates :insect, presence: true
  validates :name, presence: true
  validates :position, numericality: { greater_than: 0, only_integer: true },
                       presence: true

end
