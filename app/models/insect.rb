class Insect < ActiveRecord::Base
  attr_accessible :common_name, :scientific_name

  has_many :development_stages, dependent: :destroy, inverse_of: :insect

  validates :common_name, presence: true
  validates :scientific_name, presence: true, uniqueness: true

end
