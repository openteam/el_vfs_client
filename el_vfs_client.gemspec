$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'el_vfs_client/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'el_vfs_client'
  s.version     = ElVfsClient::VERSION
  s.authors     = ['Dmitry Lihachev', 'Evgeny Lapin', 'Iliy Manin', 'Evgeniy Serykh']
  s.email       = ['mail@openteam.ru']
  s.homepage    = 'https://github.com/openteam/el_vfs_client'
  s.summary     = 'Summary of ElVfsClient.'
  s.description = 'Description of ElVfsClient.'

  s.files = Dir['{app,config,lib}/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'configliere'
  s.add_dependency 'curb'
  s.add_dependency 'rails'

  s.add_development_dependency 'sass-rails'
end
