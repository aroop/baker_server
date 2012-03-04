$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "baker_server/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "baker_server"
  s.version     = BakerServer::VERSION
  s.authors     = ["Ajay Kumar Guthikonda"]
  s.email       = ["aroopchandra@gmail.com"]
  s.homepage    = "http://aroop.github.com/"
  s.summary     = "BakerServer is a open source server side component used in Baker project"
  s.description = "Description of BakerServer."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency 'rails', '~> 3.2.1'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'jbuilder', '~> 0.3.2'
  s.add_dependency 'sass-rails', '~> 3.1'
  s.add_dependency 'simple-navigation', '~> 3.6.0'
  s.add_dependency 'bootstrap-haml-rails'
  s.add_dependency 'dragonfly', '~> 0.9.8'
  s.add_dependency 'rack-cache', '>= 0.5.3'
  s.add_dependency 'simple_form', '~> 2.0.0'
  s.add_dependency 'will_paginate', '~> 3.0.3'
  s.add_dependency 'friendly_id', '~> 4.0.0'
  s.add_dependency 'paper_trail', '~> 2'
  s.add_dependency 'inherited_resources', '~> 1.3.0'
  s.add_dependency 'bootstrap-sass', '~> 2.0.0'


  #Gems used for testing
  s.add_development_dependency 'rspec-rails', '~> 2.8.1'
  s.add_development_dependency 'capybara', '~> 1.1.2'
  s.add_development_dependency 'faker'
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'capybara-webkit', '0.10.0'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'ruby_gntp'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-spork'
  s.add_development_dependency 'rb-inotify'
  s.add_development_dependency 'rb-fsevent'
  s.add_development_dependency 'rb-fchange'
  s.add_development_dependency 'libnotify'
end
