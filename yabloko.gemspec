# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "yabloko/version"

Gem::Specification.new do |s|
  s.name        = "yabloko"
  s.version     = Yabloko::VERSION
  s.authors     = ["Igor Afonov"]
  s.email       = ["afonov@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{BDD tool for infrastructure setup.}
  s.description = %q{BDD tool for infrastructure setup. Use plain english to setup, maintain and document your infrastructure setup.}

  s.rubyforge_project = "yabloko"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "chef"
  s.add_runtime_dependency "cucumber"
end
