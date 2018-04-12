require_relative "boot"
require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you"ve limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Flower
  class Application < Rails::Application
    config.load_defaults 5.1

    config.generators do |g|
      g.test_framework false
      g.assets false
    end
  end
end
