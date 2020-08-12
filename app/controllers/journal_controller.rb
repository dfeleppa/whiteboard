   class JournalController < ApplicationController

    get "/users/journal" do
        current_user
        if logged_in?
            redirect "users/journal/#{current_user.id}"
        else
            flash[:danger] = "Please log in to view this page."
            redirect '/users/login'
        end
    end

    get "/users/journal/:id" do
        current_user
        @user_posts = UserPost.all
        erb :'users/journal'
    end
   
    get "/users/create_entry" do
        current_user
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

    end

    get '/users/user_posts/:id' do
        current_user
        set_user_post
        if !logged_in?
            redirect '/users/login'
        end
        erb :'users/user_posts/post'
    end

    get '/users/user_posts/:id/edit' do
        current_user
        set_user_post
        if !logged_in?
            redirect '/users/login'
        else
            if owns_post?(@user_post)
                erb :'users/user_posts/edit'
            else
                flash[:danger] = "Error: You cannot edit another athlete's post!"
                redirect '/'
            end
        end
    end

    patch '/users/user_posts/:id' do
        set_user_post
        if !logged_in?
            redirect '/users/login'
        else
            if owns_post?(@user_post)
                if params[:workout_name] != "" && params[:rx] != "" && params[:score] != "" && params[:workout] != ""
                    @user_post.update(score: params[:score],  workout_name: params[:workout_name], rx: params[:rx], workout: params[:workout] )
                    
                    flash[:success] = "Journal Entry Updated!"
                    redirect "users/user_posts/#{@user_post.id}"
                else
                    flash[:danger] = "Error: Please complete the journal entry form."
                    redirect '/signup'
                end
            else
                flash[:danger] = "Error: You cannot edit another athlete's post!"
                redirect '/'
            end
        end
    end

    delete 'users/user_posts/:id' do
        set_user_post
        if owns_post?(@user_post)
            @user_post.destroy
            flash[:success] = "Journal entry deleted!"
            redirect '/'
        else
            flash[:danger] = "Error: You cannot delete another athlete's post!"
            redirect '/'
        end
    end
end