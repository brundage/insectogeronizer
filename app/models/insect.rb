# == Schema Information
#
# Table name: insects
#
#  id              :integer          not null, primary key
#  scientific_name :string(255)      not null
#  common_name     :string(255)      not null
#

class Insect < ActiveRecord::Base

  attr_accessible :common_name, :development_stages_attributes, :scientific_name

  has_many :development_stages, dependent: :destroy, inverse_of: :insect
  accepts_nested_attributes_for :development_stages, allow_destroy: true,
                                reject_if: lambda { |a| a.all? { |k,v| v.blank? } }

  validates :common_name, presence: true
  validates :scientific_name, presence: true, uniqueness: true

end
