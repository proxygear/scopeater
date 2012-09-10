# -*- encoding: utf-8 -*-
require File.expand_path('../lib/scopeater/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Benoit Molenda"]
  gem.email         = ["benoit@proxygear.com"]
  gem.description   = %q{A simple tool to auto scope object}
  gem.summary       = %q{Contain base to auto scope any kind of object + Mongoid, MongoMapper and ActiveRecord Scopeaters}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "scopeater"
  gem.require_paths = ["lib"]
  gem.version       = Scopeater::VERSION
  
  gem.add_development_dependency 'rspec'
  gem.add_dependency 'activesupport'
end
