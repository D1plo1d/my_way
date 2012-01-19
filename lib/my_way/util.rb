module MyWay
  # Returns the path of the file calling the method that calls MyWay.stack_path().
  #
  # For example:
  #   Given the stack [a method in App.rb calls a method in Base.rb calls MyWay.stack_path()]
  #   MyWay.stack_path() would return App.rb
  def MyWay.stack_path()

    # Raising an exception to set the $@ stack trace variable
    begin
      raise 'foo'
    rescue 
      # we can determine the stack path by accessing the $@ variable set by the exception.
      return File.expand_path(File.dirname($@[2]))
    end
  end
end
