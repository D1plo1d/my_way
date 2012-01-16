
module MyWay
  SRC_PATH = File.expand_path(File.dirname(__FILE__))
  GEM_PATH = File.join( SRC_PATH, "..", "..")
  require File.join(SRC_PATH, "version.rb")


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

    # requiring this instance of the my_way gem
    b.gem "my_way", :require => false, :path => "#{GEM_PATH}"
    #, "=#{MyWay.VERSION}"

    b.gem "sinatra-assetpack", :require => "sinatra/assetpack",
      :git => "https://github.com/rstacruz/sinatra-assetpack.git"


    # Local Dev
    b.group :development do
      gem "sinatra-contrib", :require => false
    end

  end
end

