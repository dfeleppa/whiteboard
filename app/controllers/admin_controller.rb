class AdminController < ApplicationController
    get '/admin/create_entry' do
        if admin?
            erb :'admin/create_admin_post' 
        else
            flash[:danger] = "Only administrators can edit the Whiteboard."
            redirect '/'
        end
    end

    post '/create_admin_entry' do
        if !admin?
            flash[:danger] = "Only administrators can edit the Whiteboard."
            redirect '/users/login'
        end
        if params[:admin_workout_name] != "" && params[:admin_workout] != ""
            @admin_workout = AdminWorkout.create(admin_workout_name: params[:admin_workout_name], admin_workout: params[:admin_workout])
            flash[:success] = "New Whiteboard Entry Created!"
            redirect '/whiteboard'
        else
            flash[:danger] = "Error: Please complete the Whiteboard entry form."
        end
    end

    get '/admin/workouts/:id' do
        current_user
        set_admin_workout
        if !logged_in?
            flash[:danger] = "Error: You must be logged in to view the Whiteboard."
            
            redirect '/users/login'
        end
        erb :'admin/workout'
    end

    get '/admin/workouts/:id/edit' do
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

    patch '/admin/workouts/:id' do
        # set_user_post
        # if !logged_in?
        #     redirect '/users/login'
        # else
        #     if owns_post?(@user_post)
        #         if params[:workout_name] != "" && params[:rx] != "" && params[:score] != "" && params[:workout] != ""
        #             @user_post.update(score: params[:score],  workout_name: params[:workout_name], rx: params[:rx], workout: params[:workout] )
                    
        #             flash[:success] = "Journal Entry Updated!"
        #             redirect "users/user_posts/#{@user_post.id}"
        #         else
        #             flash[:danger] = "Error: Please complete the journal entry form."
        #             redirect '/signup'
        #         end
        #     else
        #         flash[:danger] = "Error: You cannot edit another athlete's post!"
        #         redirect '/'
        #     end
        # end
    end

    delete 'admin/workouts/:id' do
        # set_user_post
        # if owns_post?(@user_post)
        #     @user_post.destroy
        #     flash[:success] = "Journal entry deleted!"
        #     redirect '/'
        # else
        #     flash[:danger] = "Error: You cannot delete another athlete's post!"
        #     redirect '/'
        # end
    end
end