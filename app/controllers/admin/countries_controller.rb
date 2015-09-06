module Admin
  class CountriesController < BaseController

    before_action :load_map_javascript, except: [:index]

    def index
      @countries = Country.all
    end

    def show
      @country = Country.find(params[:id])
    end

    def new
      @country = Country.new
    end

    def create
      @country = Country.new(country_params)

      if @country.save
        redirect_to admin_countries_path
      else
        render :new
      end
    end

    def edit
      @country = Country.find(params[:id])
    end

    def update
      @country = Country.find(params[:id])

      if @country.update(country_params)
        redirect_to admin_countries_path
      else
        render :edit
      end
    end

    private

    def country_params
      if params[:country].present?
        params[:country].permit(:name,
                                :slug,
                                :latitude,
                                :longitude,
                                :default_zoom_level,
                                :general_information,
                                :user_id
                               )
      else
        {}
      end
    end

  end
end
