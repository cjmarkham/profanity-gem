$LOAD_PATH << File.expand_path("../lib", __FILE__)
require 'profanity_filter/version'

Gem::Specification.new do |spec|
  spec.name          = "profanity_filter"
  spec.version       = ProfanityFilter::VERSION
  spec.summary       = "Summary"
  spec.description   = "Description"
  spec.date          = "2014-11-29"
  spec.authors       = ["Carl Markham"]
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", "~> 2.12.0"
  spec.add_development_dependency "simplecov"
end
