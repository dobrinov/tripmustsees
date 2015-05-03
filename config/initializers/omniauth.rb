Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
  provider :facebook, 614311015336881, 'e65cd8a9f297a570148c038e31cfad1f',
    # client_options: {
    #   site: 'https://graph.facebook.com/v2.3',
    #   authorize_url: "https://www.facebook.com/v2.3/dialog/oauth"
    # },
    scope: 'email', display: 'page'
end
