require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, "what_is_this"
  end

  get "/" do
    erb :welcome
  end
  
  get "/index" do
    erb :index
  end

  get "/whiteboard" do
    erb :whiteboard
  end

  get "/journal" do
    erb :journal
  end

  get "/athleteinfo" do
    erb :athleteinfo
  end

  helpers do
    def logged_?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
  
  end

end
