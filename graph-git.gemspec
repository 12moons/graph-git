# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'graph-git/version'

Gem::Specification.new do |spec|
  spec.name          = "graph-git"
  spec.version       = GraphGit::VERSION
  spec.authors       = ["berpj"]
  spec.email         = ["berpj@users.noreply.github.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://mygemserver.com"
  end

  spec.summary       = %q{Graph your git repositories.}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/berpj/graph-git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rmagick", "~> 2.13.4"
  spec.add_development_dependency "gruff", "~> 0.5.1"
  spec.add_development_dependency "trollop", "~> 2.1.2"
end
