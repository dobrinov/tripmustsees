module Tracking
  extend ActiveSupport::Concern

  included do
    helper_method \
      :track
  end

  private

  def track(tracker, event, parameters={})
    flash.now[:tracking] = {
      tracker:    tracker,
      event:      event,
      parameters: parameters
    }
  end

  def mixpanel_track_about_page_view
    track(:mixpanel, 'About page viewed')
  end

  def mixpanel_track_landing_page_view
    track(:mixpanel, 'Landing page viewed')
  end

  def mixpanel_track_country_page_view(country)
    track(:mixpanel, 'Country page viewed', { name: country.name })
  end

  def mixpanel_track_city_page_view(city)
    track(:mixpanel, 'City page viewed', { name: city.name })
  end

  def mixpanel_track_location_page_view(location)
    track(:mixpanel, 'Location page viewed', { name: location.name })
  end

end
