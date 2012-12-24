# == Schema Information
#
# Table name: authors
#
#  id   :integer          not null, primary key
#  name :string(255)      not null
#

require 'spec_helper'

describe Author do

  it { should allow_mass_assignment_of :name }
  it { should validate_presence_of :name }

  it { should have_and_belong_to_many :papers }

end
