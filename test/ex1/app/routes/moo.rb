class App < MyWay::Base

  get "/moo" do
    return "My Way automatically requires all your ruby files in <b>app/routes/</b> for complex apps. This route is supplied by app/routes/moo.rb<br/><p>PS. Moo.</p> <a href='/'>back</a>"
  end

end
