# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pic_of_the_day/version'

Gem::Specification.new do |spec|
  spec.name          = "pic_of_the_day"
  spec.version       = PicOfTheDay::VERSION
  spec.authors       = ["Florian Weingarten"]
  spec.email         = ["flo@hackvalue.de"]

  spec.summary       = %q{Send a random image via email}
  spec.description   = %q{Send a random image via email}
  spec.homepage      = "https://github.com/fw42/pic_of_the_day"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "actionmailer", "~> 4.2"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.7"
  spec.add_development_dependency "byebug", "~> 0"
end
