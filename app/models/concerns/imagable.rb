module Imagable
  extend ActiveSupport::Concern

  included do
    has_many :images, as: :imageable, dependent: :destroy
  end

  def primary_image
    if images.any?
      images.order(priority: :asc).order(created_at: :asc).first
    else
      images.build
    end
  end

  def secondary_images
    images.where.not(id: primary_image.id)
  end

end
