# == Schema Information
#
# Table name: development_stages
#
#  id        :integer          not null, primary key
#  name      :string(255)      not null
#  insect_id :integer          not null
#  position  :integer          default(1), not null
#

require 'spec_helper'

describe DevelopmentStage do

  it { should allow_mass_assignment_of :insect }
  it { should allow_mass_assignment_of :name }
  it { should allow_mass_assignment_of :position }

  it { should have_many :paper_results }

  it { should validate_numericality_of(:position).only_integer() }

  it { should validate_presence_of :insect }
  it { should validate_presence_of :name }
  it { should validate_presence_of :position }

end
