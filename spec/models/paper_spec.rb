require 'spec_helper'

describe Paper do

  it { should allow_mass_assignment_of :authors_attributes }
  it { should allow_mass_assignment_of :journal }
  it { should allow_mass_assignment_of :locations_attributes }
  it { should allow_mass_assignment_of :page_end }
  it { should allow_mass_assignment_of :page_start }
  it { should allow_mass_assignment_of :published_on }
  it { should allow_mass_assignment_of :title }
  it { should allow_mass_assignment_of :volume }

  it { should have_and_belong_to_many :authors }
  it { should have_many :locations }
  it { should have_many :paper_results }
  it { should belong_to :journal }

  it { should validate_presence_of :journal }
  it { should validate_presence_of :page_end }
  it { should validate_presence_of :page_start }
  it { should validate_presence_of :published_on }
  it { should validate_presence_of :title }
  it { should validate_presence_of :volume }

end
