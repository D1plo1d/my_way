class App < MyWay::Base

  get "/" do
    return "My Way automatically requires your <b>app/app.rb</b> for simple apps.<br/> <a href='/moo'> mooooo </a>"
  end

end
