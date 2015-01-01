module Admin
  class LocationsController < BaseController

    before_action :set_country
    before_action :set_city

    before_action :load_map_javascript, except: [:index, :destroy]

    def index
      @locations = Location.all

      if @city.present?
        @locations = @locations.where(city: @city)
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
        redirect_to admin_country_city_locations_path(@country, @city)
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
        redirect_to admin_country_city_locations_path(@country, @city)
      else
        render :edit
      end
    end

    def destroy
      @location = Location.find(params[:id])
      @location.destroy

      redirect_to admin_country_city_locations_path(@country, @city)
    end

    private

    def location_params
      if params[:location].present?
        params[:location].permit(:name, :slug, :latitude, :longitude, :default_zoom_level)
      else
        {}
      end
    end

    def set_country
      if params[:country_id].present?
        @country = Country.find(params[:country_id])
      end
    end

    def set_city
      if params[:city_id].present?
        @city = City.find(params[:city_id])
      end
    end

  end
end
