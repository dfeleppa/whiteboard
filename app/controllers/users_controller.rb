class UsersController < ApplicationController

    get '/users/login' do
        erb :'/users/login'
    end

    post '/login' do
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            puts session
            redirect "users/journal/#{@user.id}"
        else
            redirect '/welcome'
        end
    end

    get '/users/signup' do
         erb :'/users/signup'
    end 

    post '/users' do
        if params[:name] != "" && params[:email] != "" && params[:password] != ""
            @user = User.create(params)
            session[:user_id] = @user.id
            redirect "users/#{@user.id}"
        else
            #ERROR
            redirect '/signup'
        end
    end

    get "/users/journal" do
        @user = User.find_by(id: session[:user_id])
        if logged_in?
          redirect "users/journal/#{@user.id}"
        else
          erb :'users/signup'
        end
      end

    get '/users/journal/:id' do
        @user = User.find_by(id: params[:id])     
        erb :'users/journal'
    end

    get '/logout' do
        session.clear
        redirect '/'  
    end

end

