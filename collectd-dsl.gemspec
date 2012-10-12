# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'collectd-dsl'

Gem::Specification.new do |gem|
  gem.name          = "collectd-dsl"
  gem.version       = Collectd::DSL::VERSION
  gem.authors       = ["Pierre-Yves Ritschard"]
  gem.email         = ["pyr@spootnik.org"]
  gem.description   = %q{Produce Valid Collectd configurations from ruby}
  gem.summary       = %q{collectd configuration dsl}
  gem.homepage      = "https://github.com/pyr/collectd-dsl"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec", ">= 2.0.0"
end
