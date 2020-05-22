class UsersController < ApplicationController
     get '/login' do
        erb :'login'
    end

    # post '/login' do
        
    # end

    get '/signup' do
        erb :'signup'
    end 
end