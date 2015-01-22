class CountriesController < ApplicationController

  before_action :load_map_javascript

  def show
    @country = Country.where(slug: params[:country_slug]).first

    if @country.nil?
      raise ActiveRecord::RecordNotFound
    end

    # Tracking
    mixpanel_track_country_page_view(@country)
  end

end
