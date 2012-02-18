# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "my_way/version"

Gem::Specification.new do |s|
  s.name        = "my_way"
  s.version     = MyWay::VERSION
  s.authors     = ["D1plo1d"]
  s.summary     = "A sinatra skeleton for simpler websites."
  s.date = Time.now.utc.strftime("%Y-%m-%d")
  s.platform = Gem::Platform::RUBY

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]


  # Dependencies
  # ============================================================================================

  # Infastructure
  s.add_dependency "rack"
  s.add_dependency "sinatra"
  s.add_dependency "bundler"
  s.add_dependency "sinatra-reloader"
  s.add_dependency "sinatra-contrib"


  # Assets
  # sinatra-assetpack needs a patch from git so we do not load it here for now.
  s.add_dependency "json"
  s.add_dependency "less"
  s.add_dependency "haml"
  s.add_dependency "erubis"

  unless (RUBY_PLATFORM =~ /x86_64-darwin/).nil? # OS X / XCode 4.2.1 Fix (requires external installation of v8. incompatible with -heroku)
    s.requirements << 'v8. For brew users type "brew install v8"'
    s.add_dependency 'libv8'
    s.add_dependency 'therubyracer'
  else
    s.add_dependency "therubyracer-heroku" # required for coffee-script
  end

  s.add_dependency "coffee-script"


  # Helpers
  s.add_dependency "padrino-helpers", ">=0.10.6.c"
  s.add_dependency "sinatra-contrib"
  s.add_dependency "i18n"
  s.add_dependency "activesupport", ">=3.2.1"

end
