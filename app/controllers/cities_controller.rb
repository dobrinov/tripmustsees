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
    @city = City.includes(:country)
                .where(slug:              params[:city_slug])
                .where(countries: { slug: params[:country_slug] }).first

    if @city.nil?
      raise ActiveRecord::RecordNotFound
    end
  end

end
