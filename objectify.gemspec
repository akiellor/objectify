# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "objectify/version"

Gem::Specification.new do |s|
  s.name        = "objectify"
  s.version     = Objectify::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Andrew Kiellor"]
  s.email       = ["akiellor@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A simple gem to make hashes and arrays of hashes behave like objects.}
  s.description = %q{A simple gem to make hashes and arrays of hashes behave like objects using proxies.}

  s.rubyforge_project = "objectify"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency('rspec')
end
