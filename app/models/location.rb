class Location < ActiveRecord::Base

  attr_accessible :address, :latitude, :locatable, :longitude, :name

  belongs_to :locatable, polymorphic: true

end
