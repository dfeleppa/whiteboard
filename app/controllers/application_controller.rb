require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "dantheman"
    register Sinatra::Flash
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
      flash[:danger] = "Please log in to view this page."
      redirect '/users/signup'
    end
  end

  get "/workouts" do
    if logged_in?
      erb :workouts
    else
      flash[:danger] = "Please log in to view this page."
      redirect '/users/signup'
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
        @user ||= User.find_by(id: session[:user_id])
    end
  
  end

end
