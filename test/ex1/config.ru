# Load up the app's non-bundler libaries
require 'rubygems'
require 'open-uri'
require '../../lib/my_way/builder.rb'

# Leave all the heavy lifting to My Way (sweet glorious automations!)
MyWay.map "app", to: "/", via: self

