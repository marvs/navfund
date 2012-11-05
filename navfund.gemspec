# -*- encoding: utf-8 -*-
require File.expand_path('../lib/navfund/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "navfund"
  gem.version       = Navfund::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ["Marvin Baltazar"]
  gem.email         = ["marvin.baltazar@gmail.com"]
  gem.description   = %q{Data scraper for Philippine-based Investment Fund Net Asset Values (NAVs)}
  gem.summary       = %q{This gem allows you to fetch the latest NAVPU/NAVPS from Philippine-based Investment Funds. In the future, this gem will include support for other countries as well!}
  gem.homepage      = "http://mambin.com"
  
  gem.add_runtime_dependency "nokogiri"
  gem.add_development_dependency "rake"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
