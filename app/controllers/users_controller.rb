class UsersController < ApplicationController
     get '/login' do
        erb :'login'
    end

    post '/login' do
        @user = User.find_by(email: params[:email])

        if @user.authenticate(params[:password])
            
            session[:user_id] = @user.id
            
            puts session
            redirect "users/#{@user.id}"
        else
            "DIE."
        end
    end

    get '/signup' do
        erb :'signup'
    end 

    post '/users' do
        if params[:name] != "" && params[:email] != "" && params[:password] != ""
             @user = User.create(params)
            
            redirect "/#{@user.id}"
            
        else
            redirect '/'
        end
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :'athleteinfo.erb'
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

end