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
        set_admin_workout
        if !logged_in?
            redirect '/users/login'
            flash[:danger] = "Error: You must be logged in to view the Whiteboard."
        else
            if admin?
                erb :'admin/edit'
            else
                flash[:danger] = "Error: Only administrators can edit the Whiteboard."
                redirect '/'
            end
        end
    end

    patch '/admin/workouts/:id' do
        set_admin_workout
        if !logged_in?
            redirect '/users/login'
            flash[:danger] = "Error: You must be logged in to view the Whiteboard."
        else
            if admin?
                if params[:admin_workout_name] != "" && params[:admin_workout] != ""
                    @admin_workout.update(admin_workout_name: params[:admin_workout_name], admin_workout: params[:admin_workout] )
                    flash[:success] = "Workout Updated!"
                    redirect '/'
                else
                    flash[:danger] = "Error: Please complete the workout edit form."
                    redirect '/signup'
                end
            else
                flash[:danger] = "Error: Only administrators can edit the Whiteboard."
                redirect '/'
            end
        end
    end

    delete '/admin/workouts/:id' do
        set_admin_workout
        if admin?
            @admin_workout.destroy
            flash[:success] = "Workout deleted!"
            redirect '/'
        else
            flash[:danger] = "Error: Only administrators can delete workouts"
            redirect '/'
        end
    end
end