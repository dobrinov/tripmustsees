class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method \
    :additional_head_javascripts,
    :additional_body_javascripts

  private

  def load_additional_head_javascript(script_attributes)
    @_additional_head_javascripts ||= []
    @_additional_head_javascripts << script_attributes
  end

  def load_additional_body_javascript(script_attributes)
    @_additional_body_javascripts ||= []
    @_additional_body_javascripts << script_attributes
  end

  def load_map_javascript
    load_additional_head_javascript(
      {
        src: '//maps.googleapis.com/maps/api/js?key=AIzaSyB_h7Z3zxzpXQy7MmX_UPcHHez_vdf8z1w'
      }
    )
  end
end
