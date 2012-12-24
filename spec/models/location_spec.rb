# == Schema Information
#
# Table name: locations
#
#  id             :integer          not null, primary key
#  address        :string(255)
#  latitude       :float
#  locatable_id   :integer
#  locatable_type :string(255)
#  longitude      :float
#  name           :string(255)
#

require 'spec_helper'

describe Location do

  it { should allow_mass_assignment_of :address }
  it { should allow_mass_assignment_of :latitude }
  it { should allow_mass_assignment_of :locatable }
  it { should allow_mass_assignment_of :longitude }
  it { should allow_mass_assignment_of :name }

  it { should belong_to(:locatable) }

end
