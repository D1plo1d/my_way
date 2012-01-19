module MyWay
  module ClassMethods

    # static view folders helper
    def statically_route(route, *args)
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
    end # (statically_route)


  end
end
