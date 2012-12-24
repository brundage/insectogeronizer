# == Schema Information
#
# Table name: paper_results
#
#  id                   :integer          not null, primary key
#  development_stage_id :integer          not null
#  hours_high           :float
#  hours_low            :float
#  hours_mean           :float
#  paper_id             :integer          not null
#  standard_deviation   :float
#  temperature          :float            not null
#

class PaperResult < ActiveRecord::Base

  attr_accessible :development_stage, :hours_high, :hours_low, :hours_mean,
                  :paper, :standard_deviation, :temperature

  belongs_to :development_stage, inverse_of: :paper_results
  belongs_to :paper, inverse_of: :paper_results

  validates :development_stage, presence: true
  validates :hours_high, numericality: { greater_than: 0 }
  validates :hours_low, numericality: { greater_than: 0 }
  validates :hours_mean, numericality: { greater_than: 0 }
  validates :paper, presence: true
  validates :standard_deviation, numericality: { greater_than: 0 }
  validates :temperature, presence: true

end
