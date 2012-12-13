require 'spec_helper'

describe Insect do

  it { should allow_mass_assignment_of :common_name }
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
