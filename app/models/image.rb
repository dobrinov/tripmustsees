class Image < ActiveRecord::Base
  # Associations
  belongs_to :imageable, polymorphic: true

  # Uploader
  mount_uploader :file, ImageUploader
end
