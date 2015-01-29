class City < ActiveRecord::Base

  # Modules
  include Imagable

  # Associations
  belongs_to :country
  has_many :locations, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :slug, presence: true,
                   uniqueness: { scope: :country },
                   format: { with: /\A[a-z_]+\z/ }
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :default_zoom_level, presence: true

  def self.find_by_slug(country_slug, slug)
    city = City.includes(:country)
               .where(slug: slug)
               .where(countries: { slug: country_slug }).first

    if city.nil?
      raise ActiveRecord::RecordNotFound
    end

    city
  end
end
