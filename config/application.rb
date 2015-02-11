require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tripmustsees
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true

    # Additional JS assets for compilation
    Rails.application.config.assets.precompile += [
    ]

    # Additional CSS assets for compilation
    Rails.application.config.assets.precompile += [
    ]
  end
end
