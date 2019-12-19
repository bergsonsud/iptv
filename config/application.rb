require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Iptv
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.serve_static_assets = true
    #config.assets.precompile += %w( teste.css )
    config.assets.js_compressor = Uglifier.new(compress: { reduce_vars: false, collapse_vars: false })

    #config.load_defaults 5.2
    # config.assets.paths << Rails.root.join("app", "assets", "fonts")
    # config.assets.paths << Rails.root.join("app", "assets", "images")
    # config.assets.paths << Rails.root.join("app", "assets", "bootstrap")
    # config.assets.paths << Rails.root.join("app", "assets", "rs-plugin-5")
    # config.assets.paths << Rails.root.join("app", "assets", "magnific-popup")
    # config.assets.paths << Rails.root.join("app", "assets", "owlcarousel2")
    # config.assets.paths << Rails.root.join("app", "assets", "morphext")

    # config.assets.paths << Rails.root.join('vendor', 'assets', 'components', 'gentelella', 'production')

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
