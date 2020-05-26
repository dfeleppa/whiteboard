   class JournalController < ApplicationController

    get "/users/journal" do
        @user = User.find_by(id: session[:user_id])
        if logged_in?
            redirect "users/journal/#{@user.id}"
        else
            flash[:danger] = "Please log in to view this page."
            redirect '/users/login'
        end
    end

    get "/users/journal/:id" do
        @user = User.find_by(id: params[:id])     
        erb :'users/journal'
    end
   
    get "/users/create_entry" do
        @user = User.find_by(id: session[:user_id])
        if logged_in?
            erb :'users/create_entry'
        else
            flash[:danger] = "Please log in to view this page."
            redirect '/users/login'
        end
    end

    post '/create_entry' do
        if !logged_in?
            redirect '/users/login'
        end
          if params[:workout_name] != "" && params[:rx] != "" && params[:score] != "" && params[:workout] != ""
            
            @user_post = UserPost.create(user_id: current_user.id, workout_name: params[:workout_name], score: params[:score], rx: params[:rx], workout: params[:workout])
            flash[:success] = "New Journal Entry Created!"
            redirect "users/user_posts/#{@user_post.id}"
        else
            flash[:danger] = "Error: Please complete the journal entry form."
            redirect '/signup'
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
    end

    get '/users/user_posts/:id' do
        @user_post = UserPost.find(params[:id])
        erb :'users/user_posts/post'
    end


end