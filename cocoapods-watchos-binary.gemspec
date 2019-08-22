# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-watchos-binary/gem_version.rb'

Gem::Specification.new do |spec|
  spec.name          = 'cocoapods-watchos-binary'
  spec.version       = CocoapodsWatchosBinary::VERSION
  spec.authors       = ['Austin Kwong']
  spec.email         = ['augustine@nex.team']
  spec.description   = %q{A short description of cocoapods-watchos-binary.}
  spec.summary       = %q{A longer description of cocoapods-watchos-binary.}
  spec.homepage      = 'https://github.com/EXAMPLE/cocoapods-watchos-binary'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end