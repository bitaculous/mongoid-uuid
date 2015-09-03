#!/usr/bin/env gem build

require File.expand_path '../lib/mongoid/uuid/version', __FILE__

Gem::Specification.new 'mongoid-uuid', Mongoid::UUID::VERSION do |spec|
  spec.summary          = 'Universally unique identifier (UUID) for [Mongoid] documents'
  spec.author           = 'Maik Kempe'
  spec.email            = 'mkempe@bitaculous.com'
  spec.homepage         = 'https://bitaculous.github.io/mongoid-uuid/'
  spec.license          = 'MIT'
  spec.files            = Dir['{lib}/**/*', 'LICENSE', 'README.md']
  spec.extra_rdoc_files = ['LICENSE', 'README.md']

  spec.required_ruby_version     = '~> 2.1'
  spec.required_rubygems_version = '~> 2.4'

  spec.add_runtime_dependency 'mongoid', '>= 4.0.2', '<= 5.0.0.rc0'
  spec.add_runtime_dependency 'uuid',    '~> 2.3.8'

  spec.add_development_dependency 'bundler',       '~> 1.10'
  spec.add_development_dependency 'rake',          '~> 10.4.2'
  spec.add_development_dependency 'rspec',         '~> 3.3.0'
  spec.add_development_dependency 'mongoid-rspec', '>= 2.2.0', '<= 2.3.0.rc0'
end