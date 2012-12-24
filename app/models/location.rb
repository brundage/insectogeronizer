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

class Location < ActiveRecord::Base

  attr_accessible :address, :latitude, :locatable, :longitude, :name

  belongs_to :locatable, polymorphic: true

end
