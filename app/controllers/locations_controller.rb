class LocationsController < ApplicationController

  before_action :load_map_javascript

  def show
    @location = Location.includes(:city => :country)
                               .where(             slug: params[:location_slug]      )
                               .where(cities:    { slug: params[:city_slug]         })
                               .where(countries: { slug: params[:country_slug]      }).first

    if @location.nil?
      raise ActiveRecord::RecordNotFound
    end
  end

end
