# Legacy / TODO: This isn't used anymore but it would be nice if it was.. any way to do that?
source :rubygems


# Infastructure
gem "rack"
gem "sinatra", :require => "sinatra/base"


# Assets
gem "sinatra-assetpack", :git => "https://github.com/rstacruz/sinatra-assetpack.git", :require => "sinatra/assetpack"
gem "json"
gem "less"
gem "haml"
gem "erubis"
gem "therubyracer" # required for coffee-script
gem "coffee-script"


# Helpers
gem "padrino-helpers"
gem "i18n"


# ENV-specific Libraries
# ============================================================================================

# Local Dev
group :development do
  gem "sinatra-contrib", :require => false
end


# Staging
group :test do

end


# Production
group :production do

end

