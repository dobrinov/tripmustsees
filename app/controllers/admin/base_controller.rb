module Admin
  class BaseController < ::ApplicationController
    if Rails.env.production?
      http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASS']
    end
  end
end
