class UsersController < ApplicationController

    get '/users/login' do
        erb :'/users/login'
    end

    post '/login' do
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            puts session
            
            flash[:success] = "Login Succesful!"
            redirect "users/journal/#{@user.id}"
        else
            flash[:danger] = "Error: Incorrect email or password, please try again."
            redirect '/users/login'
        end
    end

    get '/users/signup' do
         erb :'/users/signup'
    end 

    post '/users' do
        if params[:name] != "" && params[:email] != "" && params[:password] != ""
            @user = User.create(params)
            session[:user_id] = @user.id
            flash[:success] = "New Athlete Account Created!"
            redirect "users/journal/#{@user.id}"
        else
            flash[:danger] = "Error: Invalid data, please try again."
            redirect '/signup'
        end
    end

    get '/users/logout' do
        session.clear
        redirect '/'  
    end

end

