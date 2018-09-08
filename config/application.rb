require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DashboardV3
  class Application < Rails::Application
		config.load_defaults 5.2
    config.generators.system_tests = nil
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    config.generators.javascript_engine = :js
    config.generators do |g|
      g.test_framework nil, fixture: false
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.controller :test_framework => false, :helper => false, :assets => false
      g.view_specs false
      g.helper_specs false
      g.system_tests = nil
    end
  end
end
