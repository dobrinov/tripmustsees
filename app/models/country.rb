class Country < ActiveRecord::Base

  # Modules
  include Imagable

  # Associations
  has_many :cities, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true, format: { with: /[a-z_]+/ }
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :default_zoom_level, presence: true

end
