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

require 'spec_helper'

describe PaperResult do

  it { should allow_mass_assignment_of :development_stage }
  it { should allow_mass_assignment_of :hours_high }
  it { should allow_mass_assignment_of :hours_low }
  it { should allow_mass_assignment_of :hours_mean }
  it { should allow_mass_assignment_of :paper }
  it { should allow_mass_assignment_of :standard_deviation }
  it { should allow_mass_assignment_of :temperature }

  it { should belong_to :development_stage }
  it { should belong_to :paper }

  it { should validate_numericality_of :hours_high }
  it { should validate_numericality_of :hours_low }
  it { should validate_numericality_of :hours_mean }
  it { should validate_numericality_of :standard_deviation }

  it { should validate_presence_of :development_stage }
  it { should validate_presence_of :paper }
  it { should validate_presence_of :temperature }

end
