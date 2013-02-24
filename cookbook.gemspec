# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cookbook/version'

Gem::Specification.new do |gem|
  gem.name          = "classes"
  gem.version       = Cookbook::VERSION
  gem.authors       = ["Peter Bomars"]
  gem.email         = ["pbomars@gmail.com"]
  gem.description   = %q{A simple recipe parsing gem for coders that cook}
  #gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = "https://github.com/gekken/classes"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
