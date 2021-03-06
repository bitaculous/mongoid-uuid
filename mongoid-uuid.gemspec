#!/usr/bin/env gem build

require_relative 'lib/mongoid/uuid/version'

Gem::Specification.new 'mongoid-uuid', Mongoid::UUID::VERSION do |spec|
  spec.summary          = 'Universally unique identifier (UUID) for Mongoid documents.'
  spec.author           = 'Maik Kempe'
  spec.email            = 'mkempe@bitaculous.com'
  spec.homepage         = 'https://bitaculous.github.io/mongoid-uuid/'
  spec.license          = 'MIT'
  spec.files            = Dir['{lib,spec}/**/*', 'CHANGELOG.md', 'CONTRIBUTING.md', 'LICENSE', 'README.md']
  spec.extra_rdoc_files = ['CHANGELOG.md', 'CONTRIBUTING.md', 'LICENSE', 'README.md']

  spec.required_ruby_version     = '~> 2.1'
  spec.required_rubygems_version = '~> 2.4'

  spec.add_runtime_dependency 'mongoid', '>= 5.0', '< 6.0'
  spec.add_runtime_dependency 'uuid',    '~> 2.3', '>= 2.3.8'

  spec.add_development_dependency 'rake',          '~> 10.5', '>= 10.5.0'
  spec.add_development_dependency 'rspec',         '~> 3.4',  '>= 3.4.0'
  spec.add_development_dependency 'mongoid-rspec', '~> 3.0',  '>= 3.0.0'
end