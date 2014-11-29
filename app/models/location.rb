class Location < ActiveRecord::Base

  # Associations
  belongs_to :city

  # Validations
  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

end
