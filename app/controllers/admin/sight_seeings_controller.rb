module Admin
  class SightSeeingsController < BaseController

    before_action :set_country
    before_action :set_city

    def index
      @sight_seeings = SightSeeing.all

      if @city.present?
        @sight_seeings.where(city: @city)
      end
    end

    def show
    end

    def new
      @sight_seeing = SightSeeing.new
    end

    def create
      @sight_seeing = SightSeeing.new(sight_seeing_params)

      @city.locations << @sight_seeing

      if @sight_seeing.save
        redirect_to admin_country_city_sight_seeings_path(@country, @city)
      else
        render :new
      end
    end

    def edit
      @sight_seeing = SightSeeing.find(params[:id])
    end

    def update
      @sight_seeing = SightSeeing.find(params[:id])

      if @sight_seeing.update(sight_seeing_params)
        redirect_to admin_country_city_sight_seeings_path(@country, @city)
      else
        render :edit
      end
    end

    def destroy
    end

    private

    def sight_seeing_params
      if params[:sight_seeing].present?
        params[:sight_seeing].permit(:name)
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