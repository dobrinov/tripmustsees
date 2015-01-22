class StaticPagesController < ApplicationController

  def about
    mixpanel_track_about_page_view
  end

  def landingpage
    mixpanel_track_landing_page_view
  end

end
