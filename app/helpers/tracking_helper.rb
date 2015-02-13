module TrackingHelper

  def trackers
    APP_CONFIG['tracking'].keys
  end

  def do_tracking?
    Rails.env.development? || Rails.env.production?
  end

end
