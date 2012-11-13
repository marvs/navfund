# -*- encoding: utf-8 -*-
require File.expand_path('../lib/navfund/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "navfund"
  gem.version       = Navfund::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ["Marvin Baltazar"]
  gem.email         = ["marvin.baltazar@gmail.com"]
  gem.description   = %q{Data scraper for Investment Fund Net Asset Values (NAVs)}
  gem.summary       = %q{Navfund is a ruby gem that fetches the values of the current NAVPU/NAVPS of several Banks/Providers of UITFs/Mutual Funds}
  gem.homepage      = "https://github.com/marvs/navfund"
  
  gem.add_runtime_dependency "nokogiri"
  gem.add_development_dependency "rake"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
