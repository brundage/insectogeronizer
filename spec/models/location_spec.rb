require 'spec_helper'

describe Location do

  it { should allow_mass_assignment_of :address }
  it { should allow_mass_assignment_of :latitude }
  it { should allow_mass_assignment_of :locatable }
  it { should allow_mass_assignment_of :longitude }
  it { should allow_mass_assignment_of :name }

  it { should belong_to(:locatable) }

end
