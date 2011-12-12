module MyWay
  def auto_config(root_path)

    require "bundler"
    require "yaml"

    # reloader needs to be before bundler.. it's screwed up but it works
    require 'sinatra/reloader' if ENV['RACK_ENV'].to_sym == :development

    Bundler.require(:default, ENV['RACK_ENV'])

    require File.join(root_path, "app", "app.rb")

  end
