class SitemapsController < ApplicationController

  def index
    @static_paths = [
      root_path
    ]

    @countries = Country.all
    @cities    = City.all
    @locations = Location.all

    respond_to do |format|
      format.xml { render layout: false }
    end
  end

end
