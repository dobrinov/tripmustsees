class SightSeeingsController < ApplicationController

  def show
    @sight_seeing = SightSeeing.find(params[:id])
  end

end
