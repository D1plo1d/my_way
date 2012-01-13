module MyWay
  # Usage:
  #   map "my_app_directory", to: "/url/", via: self
  #
  # Set :via to your Rack builder instance if your not using a standard rackup-style config.ru
  #
  def MyWay.map (app_dir = "./app", opts = {to: "/", via: nil})

    # Getting the method that called this one from the stack
    begin
      raise 'foo'
    rescue 
      # By assuming the file that called MyWay.config() was /config.ru
      # we can determine the root directory of the app
      $my_way_root_path = File.expand_path(File.dirname($@[1]))
      puts "Starting MyWay for #{$my_way_root_path}"
    end
    app_path = File.join $my_way_root_path, app_dir



    # Standard My Way Libraries
    require "rubygems"
    require "bundler"
    require "yaml"
    require "json"


    # reloader needs to be before bundler.. it's screwed up but it works
    require 'sinatra/reloader' if ENV['RACK_ENV'].nil? or ENV['RACK_ENV'].to_sym == :development


    Bundler.require(:default, ENV['RACK_ENV'])


    require "sinatra/assetpack"
    require "padrino-helpers"


    require "my_way/base"

    load_route = Proc.new { |f| require f if File.exists?( f ) }
    # Loading simple app.rb routes
    simple_route_file =  load_route.call(File.join app_path, "app.rb")
    # Loading complex multifile /APP_FOLDER/routes/ folder routes
    if File.exists?( routes_path = File.join(app_path, "routes") )
      Dir.foreach(routes_path) do |f|
        load_route.call File.join(app_path, "routes", f) unless f == "." or f == ".."
      end
    end


    # Routing the application
    builder = opts[:via]
    builder.map opts[:to] do
      run App
    end

  end
end

