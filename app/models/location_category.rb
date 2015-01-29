class LocationCategory < ActiveRecord::Base
  has_many :locations

  default_scope { order(name: :asc) }
end
