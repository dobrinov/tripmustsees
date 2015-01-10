module Imagable
  extend ActiveSupport::Concern

  included do
    has_many :images, as: :imageable, dependent: :destroy
  end

  def primary_image
    images.order(priority: :asc)
          .order(created_at: :asc)
          .limit(1).first
  end

  def secondary_images
    images.where.not(id: primary_image.id)
  end

end
