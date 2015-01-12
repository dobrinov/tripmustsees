class LocationsController < ApplicationController

  before_action :load_map_javascript

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
      @location = Location.includes(:city => :country)
                          .where(             slug: params[:location_slug]  )
                          .where(cities:    { slug: params[:city_slug]     })
                          .where(countries: { slug: params[:country_slug]  }).first

      if @location.nil?
        raise ActiveRecord::RecordNotFound
      end
    end

    respond_to do |format|
      format.html
      format.json { render layout: false }
    end
  end

end
