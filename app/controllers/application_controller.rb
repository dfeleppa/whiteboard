require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  get "/whiteboard" do
    erb :whiteboard
  end

  get "/journal" do
    erb :journal
  end

end
