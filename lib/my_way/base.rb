module MyWay
  module Base
    include MyWay::ClassMethods

    def self.registered(app)
      app.register Sinatra::AssetPack

      # Helpers
      # ======================================
      app.register Padrino::Helpers

      # src reloading
      # ======================================
      app.configure(:development) do
        app.register Sinatra::Reloader
        app.also_reload "lib/*.rb"
        app.also_reload "app/models/*.rb"
        app.also_reload "config/*"
      end


      #if settings.environment == :development
        #register Sinatra::Contrib
      #end


      # view routing
      # ======================================



      # asset routing
      # ======================================
      app.register Sinatra::AssetPack
      # Asset Pack needs to be intialized inside the context of the application instance.
      app.assets {
        #lib assets
        serve '/lib/js',     from: '../lib/js'
        serve '/lib/css',    from: '../lib/css'
        serve '/lib/images', from: '../lib/images'
        serve '/lib/ie',     from: '../lib/ie'
        # ignore less libraries so they can be imported in the traditional less style
        ignore '/lib/css/twitter-bootstrap/*'
        # app assets
        serve '/js',     from: 'js'
        serve '/css',    from: 'css'
        serve '/images', from: 'images'
        # packaging
        serve '/lib/last-js/',  from: '../lib/last-js'
        js :ie, ['/lib/ie/js/**.js']
        js :all, [
          '/lib/js/jquery-1.*.js',
          '/lib/js/jquery-ui-*.js',
          '/lib/js/**.js',
          '/js/**.js',
          '/lib/last-js/**.js']
        css :all, ['/lib/css/**.css', '/css/bootstrap/*.css', '/css/**.css']
      }


    end
  end
end
