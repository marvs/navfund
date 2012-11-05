# -*- encoding: utf-8 -*-
require File.expand_path('../lib/navfund/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Marvin Baltazar"]
  gem.email         = ["marvin.baltazar@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "navfund"
  gem.require_paths = ["lib"]
  gem.version       = Navfund::VERSION
end
