# == Schema Information
#
# Table name: authors
#
#  id   :integer          not null, primary key
#  name :string(255)      not null
#

class Author < ActiveRecord::Base

  attr_accessible :name

  has_and_belongs_to_many :papers

  validates :name, presence: true

end
