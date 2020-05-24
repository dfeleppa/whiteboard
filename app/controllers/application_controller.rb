require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, "secret"
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      redirect "/welcome"
    end
  end
  
  get "/welcome" do
    erb :welcome
  end

  get "/whiteboard" do
    if logged_in?
      erb :whiteboard
    else
      redirect '/signup'
    end
  end

  get "/workouts" do
    if logged_in?
      erb :workouts
    else
      redirect '/signup'
    end
  end

  get "/about" do
    erb :about
  end

  
  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
  
  end

end
