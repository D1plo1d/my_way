module MyWay
  def self.bundler(root_path)
    $my_way_root_path = root_path

    # Standard MyWay Libraries
    require "rubygems"
    require "bundler"
    require "yaml"
    require "json"


    # reloader needs to be before bundler.. it's screwed up but it works
    require 'sinatra/reloader' if ENV['RACK_ENV'].to_sym == :development


    Bundler.require(:default, ENV['RACK_ENV'])


    require "sinatra/assetpack"
    require "padrino-helpers"


    require File.join(File.dirname(File.absolute_path(__FILE__)),"base.rb")
    require File.join(root_path, "app", "app.rb")
  end
end
