dir = File.join(File.dirname(File.absolute_path(__FILE__)), "my_way")

# Libraries
require "yaml"
require "json"
# Libraries (Gems)
require "sinatra/base"
require "padrino-helpers"
require "sinatra/reloader"
require "active_support/all"
#require "sinatra/assetpack" # TODO
require "padrino-helpers"

# Development Libraries (Gems)
# reloader needs to be before bundler.. it's screwed up but it works (umm.. wut? nope? I'm calling bs on this.)
# Bundler has already ran by this point. If this works that comment is total bs.
require 'sinatra/reloader' if ENV['RACK_ENV'].nil? or ENV['RACK_ENV'].to_sym == :development


# My Way Files
require File.join(dir, "version.rb")
require File.join(dir, "util.rb")
require File.join(dir, "class_methods.rb")
require File.join(dir, "base.rb")
require File.join(dir, "builder.rb")

