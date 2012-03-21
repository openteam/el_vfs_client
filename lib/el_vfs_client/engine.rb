module ElVfsClient
  class Engine < Rails::Engine
    isolate_namespace ElVfsClient
    engine_root = File.expand_path("../../../", __FILE__)
    config.after_initialize do
      require 'configliere'

      # NOTE: deprecation warning
      Settings.define 'vfs.url', :env_var => 'VFS_URL'
      Settings.define 'storage.url', :env_var => 'STORAGE_URL'

      if Settings['vfs.url']
        puts ''
        puts '=== DEPRECATION WARNING: Use storage.url instead of vfs.url'
        puts ''
      end

      Settings.resolve!
    end
  end
end

