module MyWay
  # Injects a default source (:rubygems) and a set of compatible libraries for MyWay into 
  # the gemfile.
  #
  # Usage:
  #   MyWay.inject_gems into: self
  #
  # Set :into to your bundler instance
  #
  def MyWay.gemfile_header (opts = {bundler: nil})
    b = opts[:bundler]


    b.source :rubygems


    # Standard Libraries

    # Tip: to autoupgrade your MyWay install run bundle install twice
    b.gem "my_way", require: false, git: "git://github.com/D1plo1d/my_way.git"

    b.gem "sinatra-assetpack", require: "sinatra/assetpack",
      git: "https://github.com/rstacruz/sinatra-assetpack.git"


    # Local Dev
    b.group :development do
      gem "sinatra-contrib", :require => false
    end

  end
end

