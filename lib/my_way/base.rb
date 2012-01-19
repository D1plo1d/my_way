module MyWay
  class Base < Sinatra::Base

    #set :root, $my_way_root_path

    register Sinatra::AssetPack

    #if settings.environment == :development
      #register Sinatra::Contrib
    #end

    # asset routing
    # ======================================
    # TODO: does this even work? Probably not :(


=begin
    assets {
      #lib assets
      serve '/lib/js',     :from => 'lib/js'
      serve '/lib/css',    :from => 'lib/css'
      serve '/lib/images', :from => 'lib/images'
      # app assets
      serve '/js',     :from => 'app/js'
      serve '/css',    :from => 'app/css'
      serve '/images', :from => 'app/images'
      # packaging
      serve '/lib/last-js/',  :from => 'lib/last-js'
      js :all, [
        '/lib/js/jquery-1.*.js',
        '/lib/js/jquery-ui-*.js',
        '/lib/js/**.js',
        '/js/**.js',
        '/lib/last-js/**.js']
      css :all, ['/lib/css/**.css', '/css/**.css']
    }
=end


    # view routing
    # ======================================


    # static view folders helper
    # ======================================
    def self.statically_route(route, *args)
      get route do
        # passing over excluded urls
        exclude = args[0][:exclude] if args.length > 0
        exclude = [] if exclude.nil?
        pass if exclude.include? request.path

        # locating the view file (yeah this is a hack.. regexes will fail)
        page = route.sub("/", "").gsub(/:[^\\]*/) { |p| params[p.sub(":", "").to_sym]}

        # displaying the page if the view exists
        if (File.exists? File.join(settings.root, "views", "#{page}.haml") )
          puts "statically routing #{page} via #{route}"
          haml page.to_sym
        else
          pass
        end
      end
    end


    # Helpers
    # ======================================
    register Padrino::Helpers

    # src reloading
    # ======================================
    configure(:development) do
      register Sinatra::Reloader
      also_reload "lib/*.rb"
      also_reload "app/models/*.rb"
      also_reload "config/*"
    end

  end
end
