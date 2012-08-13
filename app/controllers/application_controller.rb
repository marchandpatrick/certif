class ApplicationController < ActionController::Base
  protect_from_forgery
  # Configure the default encoding used in templates for Ruby 1.9. 
  config.encoding = "utf-8"
end
