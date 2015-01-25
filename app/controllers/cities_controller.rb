class CitiesController < ApplicationController

  before_action :load_map_javascript

  def index
    @country = Country.find(params[:country_id])
    @cities = @country.cities

    respond_to do |format|
      format.json { render layout: false }
    end
  end

  def show
    @city = City.find_by_slug(params[:country_slug], params[:city_slug])
    @locations = @city.locations.order(name: :asc)

    # Tracking
    mixpanel_track_city_page_view(@city)
  end

end
