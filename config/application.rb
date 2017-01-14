require_relative 'boot'

require 'rails/all'
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module UtdebatecampCom
  class Application < Rails::Application
    config.assets.paths << Rails.root.join("app","assets","fonts")
  end
end
