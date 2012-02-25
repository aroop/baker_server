require 'simple-navigation'
require 'rack/cache'
require 'friendly_id'
require 'paper_trail'

module BakerServer
  class Engine < ::Rails::Engine
    isolate_namespace BakerServer
    SimpleNavigation.config_file_path = File.expand_path("../../../config", __FILE__)
    config.generators do |g|
      g.test_framework :rspec, :view_specs => false
      g.integration_tool :rspec
      g.template_engine :haml
    end

    config.autoload_paths << File.expand_path('../../lib/assets/stylesheets/')
    config.autoload_paths << File.expand_path('../../vendor/assets/stylesheets/')
  end
end
