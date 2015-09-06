class Country < ActiveRecord::Base

  # Modules
  include Imagable

  # Associations
  belongs_to :user
  has_many :cities, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :slug, presence: true,
                   uniqueness: true,
                   format: { with: /\A[a-z_]+\z/ }
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :default_zoom_level, presence: true

  def self.find_by_slug(slug)
    Country.where(slug: slug).first!
  end
end
