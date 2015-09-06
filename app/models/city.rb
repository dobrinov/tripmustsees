class City < ActiveRecord::Base

  # Modules
  include Imagable

  # Associations
  belongs_to :country
  belongs_to :user
  has_many :locations, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :slug, presence: true,
                   uniqueness: { scope: :country },
                   format: { with: /\A[a-z_]+\z/ }
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :default_zoom_level, presence: true

  # Scopes
  scope :published, -> { where(published: true) }
  scope :capital,   -> { where(capital: true) }

  def self.find_by_slug(country_slug, slug)
    City.includes(:country)
        .where(slug: slug)
        .where(countries: { slug: country_slug }).first!
  end
end
