class CountriesController < ApplicationController

  before_action :load_map_javascript

  def show
    @country = Country.where(slug: params[:country_slug]).first

    if @country.nil?
      raise ActiveRecord::RecordNotFound
    end
  end

end
