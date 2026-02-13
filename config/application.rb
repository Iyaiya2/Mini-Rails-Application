require_relative "boot"
require "shrine"
require "shrine/storage/file_system"

require "rails/all"


Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("storage/cache"), # temporaire
  store: Shrine::Storage::FileSystem.new("storage/store")  # permanent
}

Shrine.plugin :activerecord           # pour attacher à ActiveRecord
Shrine.plugin :cached_attachment_data # pour recharger formulaire en cas d'erreur
Shrine.plugin :validation_helpers     # validation de type et taille
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
