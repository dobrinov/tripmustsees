class City < ActiveRecord::Base

  # Associations
  belongs_to :country
  has_many :locations, dependent: :destroy

  # Validations
  validates :name, presence: true

end
