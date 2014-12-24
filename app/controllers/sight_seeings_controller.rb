class SightSeeingsController < ApplicationController

  before_action :load_map_javascript

  def show
    @sight_seeing = SightSeeing.includes(:city => :country)
                               .where(             slug: params[:sight_seeing_slug]  )
                               .where(cities:    { slug: params[:city_slug]         })
                               .where(countries: { slug: params[:country_slug]      }).first

    if @sight_seeing.nil?
      raise ActiveRecord::RecordNotFound
    end
  end

end
