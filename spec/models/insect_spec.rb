# == Schema Information
#
# Table name: insects
#
#  id              :integer          not null, primary key
#  scientific_name :string(255)      not null
#  common_name     :string(255)      not null
#

require 'spec_helper'

describe Insect do

  it { should accept_nested_attributes_for :development_stages }

  it { should allow_mass_assignment_of :common_name }
  it { should allow_mass_assignment_of :development_stages_attributes }
  it { should allow_mass_assignment_of :scientific_name }

  it { should have_many :development_stages }

  it { should validate_presence_of :common_name }
  it { should validate_presence_of :scientific_name }

  context :uniqueness do
    before do
      Insect.create! common_name: :super, scientific_name: :duper
    end
    it { should validate_uniqueness_of :scientific_name }
  end

end
