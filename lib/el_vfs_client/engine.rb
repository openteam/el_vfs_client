module ElVfsClient
  class Engine < Rails::Engine
    isolate_namespace ElVfsClient
    engine_root = File.expand_path("../../../", __FILE__)
    config.after_initialize do
      require 'configliere'
      Settings.define 'vfs.url', :env_var => 'VFS_URL', :required => true
      Settings.resolve!
    end
  end
end

