dir = File.join(File.dirname(File.absolute_path(__FILE__)), "my_way")

["version", "config"].each do |f|
  require File.join(dir, "#{f}.rb")
end

