class LocationsController < ApplicationController

  before_action :requires_login, only: [:new, :create]
  before_action :load_map_javascript

  def index
    @city = City.find(params[:city_id])
    @locations = @city.locations

    respond_to do |format|
      format.json { render layout: false }
    end
  end

  def new
    @city = City.find(params[:city_id])
    @location = Location.new
  end

  def create
    @city = City.find(params[:city_id])
    @location = Location.new(location_params.merge(
                  slug: slug_from_name(location_params[:name]),
                  user_id: current_user.id,
                  city_id: @city.id
                ))

    if @location.save
      redirect_to back_or_default(city_slug_path(country_slug: @city.country.slug, city_slug: @city.slug))
    else
      render :new
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

  private

  def location_params
    if params[:location].present?
      params[:location].permit(
                               :name,
                               :description,
                               :website,
                               :latitude,
                               :longitude,
                               :default_zoom_level,
                               :location_category_id
                              )
    else
      {}
    end
  end

  # REFACTORING: Move to a module
  def slug_from_name(name)
    name.gsub(' ', '_').downcase
  end
end
