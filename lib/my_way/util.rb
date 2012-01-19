module MyWay

  # Gets the $@ stack trace variable.
  def MyWay.stack_trace()
    # Raising an exception to set the $@ stack trace variable
    begin
      raise 'foo'
    rescue 
      return $@
    end
  end


  class << self
    attr_accessor :root, :gem_dir
  end

  MyWay.gem_dir = File.dirname(File.dirname(File.expand_path(__FILE__)))


  # By assuming the file that called MyWay is either required by bundler or a file in the app's root dir
  # we can determine the root directory of the app by finding the first non-bundler, non-my_way
  # file in the stack
  MyWay.stack_trace.each do |f|
    # TODO: better bundler detection..
    # what if an app's name includes bundler!? we'd be fucked!
    next if f.include? "bundler"
    dir = File.dirname( File.expand_path(f) )
    next if dir.include? MyWay.gem_dir

    MyWay.root = dir
    break
  end

end
