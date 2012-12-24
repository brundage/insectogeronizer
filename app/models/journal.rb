# == Schema Information
#
# Table name: journals
#
#  id   :integer          not null, primary key
#  name :string(255)      not null
#

class Journal < ActiveRecord::Base

  attr_accessible :name

  has_many :papers, dependent: :destroy, inverse_of: :journal
  has_many :authors, through: :papers

  validates_presence_of :name

end
