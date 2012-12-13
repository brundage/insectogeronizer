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
