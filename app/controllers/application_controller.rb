class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Modules
  include Tracking

  # Helper methods
  helper_method \
    :current_user,
    :logged_in?

  private

  def logged_in?
    current_user.present?
  end

  def current_user
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def load_additional_javascript(script_attributes)
    @_additional_javascripts ||= []
    @_additional_javascripts << script_attributes
  end

  def load_map_javascript
    load_additional_javascript(
      {
        src: '//maps.googleapis.com/maps/api/js?key=AIzaSyB_h7Z3zxzpXQy7MmX_UPcHHez_vdf8z1w&language=en'
      }
    )
  end
end
