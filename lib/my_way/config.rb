#TODO: automatically insert this file into /lib/my_way/config.rb with rake
$my_way_root_path = File.join(File.expand_path(File.dirname(__FILE__)), "..", "..")


# Standard My Way Libraries
require "rubygems"
require "bundler"
require "yaml"
require "json"


# reloader needs to be before bundler.. it's screwed up but it works
require 'sinatra/reloader' if ENV['RACK_ENV'].to_sym == :development


Bundler.require(:default, ENV['RACK_ENV'])


require "sinatra/assetpack"
require "padrino-helpers"


require "my_way/base"
require File.join($my_way_root_path, "app", "app.rb")

