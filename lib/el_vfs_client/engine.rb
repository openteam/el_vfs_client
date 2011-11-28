module ElVfsClient
  class Engine < Rails::Engine
    isolate_namespace ElVfsClient
    engine_root = File.expand_path("../../../", __FILE__)
    config.after_initialize do
      raise 'Please specify url for El VFS in settings yml!' unless defined?(Settings) && Settings[:el_vfs]
    end
  end
end

