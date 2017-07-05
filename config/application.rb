require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module Project
  class Application < Rails::Application
    config.load_defaults 5.1
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    config.assets.paths << Rails.root.join("vendor", "assets", "images", "fonts")
  end
end
