# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'full_tang/version'

Gem::Specification.new do |gem|
  gem.name          = "full-tang"
  gem.version       = FullTang::VERSION
  gem.authors       = ["Brandon Dennis"]
  gem.email         = ["toady00@gmail.com"]
  gem.description   = %q{Chef Server API gem}
  gem.summary       = %q{A JRuby compatible gem for interacting with a Chef Server}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec", "~> 2.6"
  gem.add_development_dependency "timecop", "~> 0.6.1"

  gem.add_dependency "mixlib-authentication"
  gem.add_dependency "json_pure"
end
