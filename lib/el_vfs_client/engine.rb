module ElVfsClient
  class Engine < Rails::Engine
    isolate_namespace ElVfsClient
    engine_root = File.expand_path("../../../", __FILE__)
    config.after_initialize do
      require 'configliere'
      Settings.define 'vfs.host', :env_var => 'VFS_HOST', :required => true
      if Settings['el_vfs']
        Settings['vfs.host'] = "#{Settings[:el_vfs][:protocol]}://#{Settings[:el_vfs][:host]}:#{Settings[:el_vfs][:port]}"
        puts
        puts "!!! WARNING !!! Use vfs.host instead el_vfs.protocol, el_vfs.host, el_vfs.port."
        puts
      end
      Settings.resolve!
    end
  end
end

