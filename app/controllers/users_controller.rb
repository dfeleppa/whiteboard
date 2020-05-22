class UsersController < ApplicationController
    get '/users/login' do
        erb :'users/login'
    end

    # post '/login' do
        
    # end

    get '/users/signup' do
        erb :'users/signup'
    end 
end