# -*- encoding: utf-8 -*-
require File.expand_path('../lib/navfund/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "navfund"
  gem.version       = Navfund::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ["Marvin Baltazar"]
  gem.email         = ["marvin.baltazar@gmail.com"]
  gem.description   = %q{Data scraper for Investment Fund Net Asset Values (NAVs)}
  gem.summary       = %q{Navfund is a ruby gem that fetches the current NAVPU/NAVPS of UITFs/Mutual Funds}
  gem.homepage      = "https://github.com/marvs/navfund"
  gem.license       = "MIT"
  
  gem.required_ruby_version = ">= 1.9.2"
  
  gem.add_runtime_dependency "nokogiri", "~> 1.4"
  gem.add_development_dependency "rake", "~> 0.8"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
