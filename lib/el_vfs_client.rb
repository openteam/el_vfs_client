require "el_vfs_client/engine"
require 'rails'

module ElVfsClient
  class Engine < ::Rails::Engine
    initializer :assets do |config|
      ::Rails.application.config.assets.precompile += %w( engine.js el_vfs/el_vfs.css )
    end
  end
end
