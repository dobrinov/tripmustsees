module Admin
  class ImagesController < BaseController

    def create
      imageable = find_imageable
      @image = Image.new(image_params)

      imageable.images << @image

      redirect_to back_or_default
    end

    def destroy
      @image = Image.find(params[:id])
      @image.destroy

      redirect_to back_or_default
    end

    private

    def find_imageable
      if params[:country_id] && params[:city_id] && params[:location_id] # Location
        Location.find(params[:location_id])
      elsif params[:country_id] && params[:city_id]                      # City
        City.find(params[:city_id])
      elsif params[:country_id]                                          # Country
        Country.find(params[:country_id])
      else
        raise "Unknown imageable type."
      end
    end

    def image_params
      if params[:image].present?
        params[:image].permit(:file)
      else
        {}
      end
    end

  end
end
