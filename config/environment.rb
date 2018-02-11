# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Whitelist locales available for the application
I18n.available_locales = [:en, :de]