# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "my_way/version"

Gem::Specification.new do |s|
  s.name        = "my_way"
  s.version     = MyWay::VERSION
  s.authors     = ["D1plo1d"]
  s.summary     = "A sinatra skeleton for simpler websites."

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]


  # Dependencies
  # ============================================================================================

  # Infastructure
  s.add_dependency "rack"
  s.add_dependency "sinatra"
  s.add_dependency "sinatra-reloader"
  s.add_dependency "bundler"


  # Assets
  # sinatra-assetpack needs a patch from git so we do not load it here for now.
  s.add_dependency "json"
  s.add_dependency "less"
  s.add_dependency "haml"
  s.add_dependency "erubis"
  s.add_dependency "therubyracer" # required for coffee-script
  s.add_dependency "coffee-script"


  # Helpers
  s.add_dependency "padrino-helpers"
  s.add_dependency "sinatra-contrib"
  s.add_dependency "i18n"

end
