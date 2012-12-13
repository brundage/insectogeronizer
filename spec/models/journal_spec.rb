require 'spec_helper'

describe Journal do

  it { should allow_mass_assignment_of :name }
  it { should validate_presence_of :name }

  it { should have_many(:papers) }
  it { should have_many(:authors).through(:papers) }

end
