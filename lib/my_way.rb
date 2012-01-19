dir = File.join(File.dirname(File.absolute_path(__FILE__)), "my_way")

# Libraries
require "sinatra/base"
require "padrino-helpers"
require "sinatra/reloader"
require "active_support/all"


# My Way Files
require File.join(dir, "version.rb")
require File.join(dir, "base.rb")
require File.join(dir, "builder.rb")

