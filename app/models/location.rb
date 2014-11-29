class Location < ActiveRecord::Base

  # Associations
  belongs_to :city

  # Validations
  validates :name, presence: true
  validates :slug, presence: true,
                   uniqueness: { scope: :city },
                   format: { with: /[a-z_]+/ }
  validates :latitude, presence: true
  validates :longitude, presence: true

end
