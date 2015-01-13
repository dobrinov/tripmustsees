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

  def self.find_by_slug(country_slug, city_slug, slug)
    location = Location.includes(:city => :country)
                       .where(             slug: slug          )
                       .where(cities:    { slug: city_slug    })
                       .where(countries: { slug: country_slug }).first

    if location.nil?
      raise ActiveRecord::RecordNotFound
    end

    location
  end

end
