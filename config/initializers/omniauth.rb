Rails.application.config.middleware.use OmniAuth::Builder do

  if Rails.env.production?
    facebook_key    = ENV['FACEBOOK_KEY']
    facebook_secret = ENV['FACEBOOK_SECRET']
  else
    facebook_key    = 614311015336881
    facebook_secret = 'e65cd8a9f297a570148c038e31cfad1f'
  end

  provider :facebook, facebook_key, facebook_secret, scope: 'email', display: 'page'
  # client_options: {
  #   site: 'https://graph.facebook.com/v2.3',
  #   authorize_url: "https://www.facebook.com/v2.3/dialog/oauth"
  # }
end
