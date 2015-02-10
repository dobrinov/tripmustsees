class LocationsController < ApplicationController

  def index
    @city = City.find(params[:city_id])
    @locations = @city.locations

    respond_to do |format|
      format.json { render layout: false }
    end
  end

  def show
    if params[:id].present?
      @location = Location.find(params[:id])
    else
      @location = Location.find_by_slug(params[:country_slug], params[:city_slug], params[:location_slug])
    end

    # Tracking
    mixpanel_track_location_page_view(@location)

    respond_to do |format|
      format.html
      format.json { render layout: false }
    end
  end

end
