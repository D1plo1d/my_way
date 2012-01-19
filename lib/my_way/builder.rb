module MyWay
  # Usage:
  #   map "my_app_directory", to: "/url/", via: self
  #
  # Set :via to your Rack builder instance if your not using a standard rackup-style config.ru
  #
  def MyWay.map (app_dir = "./app", opts = {:to => "/", :via => nil})

    # By assuming the file that called MyWay.config() was /config.ru
    # we can determine the root directory of the app
    root_path = MyWay.stack_path()
    app_path = File.join root_path, app_dir


    # Application Routes

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

