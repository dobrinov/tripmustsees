module Admin
  class LocationsController < BaseController

    before_action :set_city,              only: [:index, :new, :create]
    before_action :set_location_category, only: [:index]

    before_action :load_map_javascript, except: [:index, :destroy]

    def index
      if @city.present?
        @locations = Location.where(city: @city)
      elsif @location_category.present?
        @locations = Location.where(location_category: @location_category)
      end
    end

    def show
      @location = Location.find(params[:id])
    end

    def new
      @location = Location.new
    end

    def create
      @location = Location.new(location_params)

      @city.locations << @location

      if @location.save
        redirect_to admin_city_locations_path(@city)
      else
        render :new
      end
    end

    def edit
      @location = Location.find(params[:id])
    end

    def update
      @location = Location.find(params[:id])

      if @location.update(location_params)
        redirect_to admin_city_locations_path(@location.city)
      else
        render :edit
      end
    end

    def destroy
      @location = Location.find(params[:id])
      @location.destroy

      redirect_to admin_city_locations_path(@location.city)
    end

    private

    def location_params
      if params[:location].present?
        params[:location].permit(
                                 :name,
                                 :slug,
                                 :latitude,
                                 :longitude,
                                 :default_zoom_level,
                                 :location_category_id
                                )
      else
        {}
      end
    end

    def set_city
      if params[:city_id].present?
        @city = City.find(params[:city_id])
      end
    end

    def set_location_category
      if params[:location_category_id].present?
        @location_category = LocationCategory.find(params[:location_category_id])
      end
    end

  end
end
