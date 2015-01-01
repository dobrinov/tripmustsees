class Location < ActiveRecord::Base

  # Associations
  belongs_to :city
  belongs_to :location_category
  has_many :images, as: :imageable, dependent: :destroy

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
