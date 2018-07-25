# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# for file upload
require 'carrierwave/orm/activerecord'