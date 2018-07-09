class ApplicationController < ActionController::Base
    protect_from_forgery
    # Ensures all actions invoke this
    before_action :authenticate_user!
end
