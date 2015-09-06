class CitiesController < ApplicationController
  before_action :requires_login, only: [:new, :create]
  before_action :load_map_javascript

  def index
    @country = Country.find(params[:country_id])
    @cities = @country.cities.published

    respond_to do |format|
      format.json { render layout: false }
    end
  end

  def new
    @country = Country.find(params[:country_id])
    @city = City.new
  end

  def create
    @country = Country.find(params[:country_id])
    @city = City.new(city_params.merge(
              slug: slug_from_name(city_params[:name]),
              user_id: current_user.id,
              country_id: @country.id,
              published: true
            ))

    if @city.save
      redirect_to back_or_default(country_slug_path(country_slug: @country.slug))
    else
      render :new
    end
  end

  def show
    @city = City.find_by_slug(params[:country_slug], params[:city_slug])
    @locations = @city.locations

    # Tracking
    mixpanel_track_city_page_view(@city)
  end

  private

  def city_params
    if params[:city].present?
      params[:city].permit(:name,
                           :latitude,
                           :longitude,
                           :default_zoom_level
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
