class ApplicationController < ActionController::Base
  protect_from_forgery
  # note, helpers are avaliable to 'views' by default
  include SessionsHelper
end
