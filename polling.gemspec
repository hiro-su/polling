# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'polling/version'

Gem::Specification.new do |gem|
  gem.name          = "polling"
  gem.version       = Polling::VERSION
  gem.authors       = ["hiro-su"]
  gem.email         = ["h.sugipon@gmail.com"]
  gem.description   = %q{polling}
  gem.summary       = %q{polling}
  gem.homepage      = "https://github.com/hiro-su/polling"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "bundler", "~> 1.3"
  gem.add_development_dependency "rake"
end
