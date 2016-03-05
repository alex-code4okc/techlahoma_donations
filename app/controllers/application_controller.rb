class ApplicationController < TechlahomaAuth::ApplicationController
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  force_ssl if: :ssl_configured?

  def ssl_configured?
    Rails.env.production? && !ENV['SKIP_SSL']
  end

end
