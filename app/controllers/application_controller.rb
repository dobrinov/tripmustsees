class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Modules
  include Tracking

  private

  def load_additional_javascript(script_attributes)
    @_additional_javascripts ||= []
    @_additional_javascripts << script_attributes
  end
end
