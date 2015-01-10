class Location < ActiveRecord::Base

  # Modules
  include Imagable

  # Associations
  belongs_to :city
  belongs_to :location_category

  # Validations
  validates :name, presence: true
  validates :slug, presence: true,
                   uniqueness: { scope: :city },
                   format: { with: /[a-z_]+/ }
  validates :latitude, presence: true
  validates :longitude, presence: true

  def country
    city.country
  end

end
