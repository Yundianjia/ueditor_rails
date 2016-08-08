$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'ueditor_rails/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'ueditor_rails'
  spec.version     = UeditorRails::VERSION
  spec.authors     = ['Jasl']
  spec.email       = ['jasl9187@hotmail.com']
  spec.homepage    = 'http://github.com/jasl/ueditor_rails'
  spec.summary     = 'Ueditor integration on Rails'
  spec.description = 'Ueditor is a WYSIWYG editor adapt to Chinese habits, this gem is a easy way to integrate with Rails'

  spec.files = Dir['{app,config,db,lib,vendor}/**/*']
  spec.test_files = Dir['test/**/*']

  spec.add_dependency 'rails', '>= 4'
  spec.add_dependency 'jquery-rails'

  spec.add_development_dependency 'sqlite3'
end