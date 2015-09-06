module Admin
  class BaseController < ::ApplicationController
    before_action do
      redirect_to root_path unless logged_in? && current_user.admin?
    end

    layout 'admin'
  end
end
