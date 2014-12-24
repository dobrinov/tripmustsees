module Admin
  class CitiesController < BaseController

    before_action :set_country

    def index
      @cities = City.all

      if @country.present?
        @cities = @cities.where(country: @country)
      end
    end

    def new
      @city = City.new
    end

    def create
      @city = City.new(city_params)

      @country.cities << @city

      if @city.save
        redirect_to admin_country_cities_path(@country)
      else
        render :new
      end
    end

    def edit
      @city = City.find(params[:id])
    end

    def update
      @city = City.find(params[:id])

      if @city.update(city_params)
        redirect_to admin_country_cities_path(@country)
      else
        render :edit
      end
    end

    private

    def city_params
      if params[:city].present?
        params[:city].permit(:name, :slug, :latitude, :longitude, :default_zoom_level)
      else
        {}
      end
    end

    def set_country
      if params[:country_id].present?
        @country = Country.find(params[:country_id])
      end
    end

  end
end
