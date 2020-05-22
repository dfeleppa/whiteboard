class UsersController < ApplicationController
    get '/login' do
        erb :login
    end

    get '/users/signup' do
        erb :signup
    end 
end