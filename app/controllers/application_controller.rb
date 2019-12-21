class ApplicationController < ActionController::Base
before_action :expire_hsts


private
  def expire_hsts
    response.headers["Strict-Transport-Security"] = 'max-age=0'
  end	
end
