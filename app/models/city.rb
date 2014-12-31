class City < ActiveRecord::Base

  # Associations
  belongs_to :country
  has_many :locations, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :slug, presence: true,
                   uniqueness: { scope: :country },
                   format: { with: /[a-z_]+/ }
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :default_zoom_level, presence: true
end
