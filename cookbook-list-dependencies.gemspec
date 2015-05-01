# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cookbook/list/dependencies/version'

Gem::Specification.new do |gem|
  gem.name          = "cookbook-list-dependencies"
  gem.version       = Cookbook::List::Dependencies::VERSION
  gem.authors       = ["Azul"]
  gem.email         = ["mail@azulinho.com"]

  gem.summary       = %q{Manage chef cookbook depencies}
  gem.description   = %q{Drills down into your cookbooks and lists all the dependencies they are using}
  gem.license       = "MIT"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  gem.bindir        = "bin"
  gem.require_paths = ["lib"]

  gem.add_development_dependency "bundler", "~> 1.9"
  gem.add_development_dependency "rake", "~> 10.0"
  gem.add_runtime_dependency "json", "~> 1.8"
end
