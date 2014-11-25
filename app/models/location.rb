class Location < ActiveRecord::Base

  # Associations
  belongs_to :city

  # Validations
  validates :name, presence: true

end
