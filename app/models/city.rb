class City < ActiveRecord::Base

  # Associations
  belongs_to :country
  has_many :locations, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :default_zoom_level, presence: true

end
