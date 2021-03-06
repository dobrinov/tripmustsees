module Tracking
  extend ActiveSupport::Concern

  included do
    helper_method \
      :track
  end

  private

  def track(tracker, event, parameters={})
    flash.now[:tracking]                   ||= {}
    flash.now[:tracking][tracker]          ||= {}
    flash.now[:tracking][tracker][:events] ||= []

    flash.now[:tracking][tracker][:events] << {
      name:       event,
      parameters: parameters
    }
  end

  def track_mixpanel(event, params={})
    # Explicitly set the referrer and the referring_domain,
    # which should be used in Mixpanel
    params['$referrer']         = mixpanel_referrer
    params['$referring_domain'] = mixpanel_referring_domain

    track(:mixpanel, event, params)
  end

  def mixpanel_track_about_page_view
    track_mixpanel('About page viewed')
  end

  def mixpanel_track_landing_page_view
    track_mixpanel('Landing page viewed')
  end

  def mixpanel_track_country_page_view(country)
    track_mixpanel('Country page viewed', { name: country.name })
  end

  def mixpanel_track_city_page_view(city)
    track_mixpanel('City page viewed', { name: city.name })
  end

  def mixpanel_track_location_page_view(location)
    track_mixpanel('Location page viewed', { name: location.name })
  end

  def mixpanel_referrer
    request.referer.present? ? request.referer : '$direct'
  end

  def mixpanel_referring_domain
    if request.referer
      URI.parse(request.referer).host
    else
      '$direct'
    end
  end
end
