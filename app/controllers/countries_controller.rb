class CountriesController < ApplicationController

  def show
    @country = Country.where(slug: params[:country_slug]).first

    if @country.nil?
      raise ActiveRecord::RecordNotFound
    end
  end

end
