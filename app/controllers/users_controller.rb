class UsersController < ApplicationController
     get '/login' do
        erb :'login'
    end

    post '/login' do
        @user = User.find_by(email: params[:email])

        if @user.authenticate(params[:password])
        
        else

        end
    end

    get '/signup' do
        erb :'signup'
    end 
end