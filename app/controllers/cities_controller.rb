class CitiesController < ApplicationController

  before_action :load_map_javascript

  def show
    @city = City.includes(:country)
                .where(slug:              params[:city_slug])
                .where(countries: { slug: params[:country_slug] }).first

    if @city.nil?
      raise ActiveRecord::RecordNotFound
    end
  end

end
