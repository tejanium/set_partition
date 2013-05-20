# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'set_partition/version'

Gem::Specification.new do |spec|
  spec.name          = "set_partition"
  spec.version       = SetPartition::VERSION
  spec.authors       = ["Teja Sophista V.R."]
  spec.email         = ["tejanium@yahoo.com"]
  spec.description   = "Set Partition"
  spec.summary       = "Ruby implementation of http://en.wikipedia.org/wiki/Partition_of_a_set based on paper Efficient Generation of Set Partitions by Michael Orlov <orlovm@cs.bgu.ac.il>"
  spec.homepage      = "http://github.com/tejanium/set_partition"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
