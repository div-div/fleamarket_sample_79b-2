class ApplicationController < ActionController::Base

  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    root_path(resource)
  end


  def production?
      Rails.env.production?
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

end
