class Country < ActiveRecord::Base

  # Associations
  has_many :cities, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

end
