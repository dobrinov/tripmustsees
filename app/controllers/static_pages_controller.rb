class StaticPagesController < ApplicationController
  def about
    mixpanel_track_about_page_view
  end

  def landingpage
    @countries = Country.all.order(name: :asc)

    header_transparent!
    mixpanel_track_landing_page_view
  end

  def privacy
  end

  def terms_of_service
  end

  def contribute
  end
end
