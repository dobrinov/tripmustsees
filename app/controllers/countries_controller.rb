class CountriesController < ApplicationController

  before_action :requires_login, only: [:new, :create]
  before_action :load_map_javascript

  def index
    @countries = Country.all.order(name: :asc)

    respond_to do |format|
      format.html
      format.json { render layout: false }
    end
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params.merge(
                slug: slug_from_name(country_params[:name]),
                user_id: current_user.id
              ))

    if @country.save
      redirect_to back_or_default(countries_path)
    else
      render :new
    end
  end

  def show
    @country = Country.where(slug: params[:country_slug]).first

    if @country.nil?
      raise ActiveRecord::RecordNotFound
    end

    @cities = @country.cities.published.order(capital: :desc).order(population: :desc)

    # Tracking
    mixpanel_track_country_page_view(@country)
  end

  private

  def country_params
    if params[:country].present?
      params[:country].permit(:name, :latitude, :longitude, :default_zoom_level)
    else
      {}
    end
  end

  # REFACTORING: Move to a module
  def slug_from_name(name)
    name.gsub(' ', '_').downcase
  end
end
