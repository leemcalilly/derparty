class ApplicationController < ActionController::Base
  protect_from_forgery
  
  if Rails.env.production? do
    before_filter :check_url
  end

  def check_url
    redirect_to request.protocol + "www." + request.host_with_port + request.fullpath if !/^www/.match(request.host)
  end
end
