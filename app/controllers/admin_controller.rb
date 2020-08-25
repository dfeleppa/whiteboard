class AdminController < ApplicationController
    get '/admin/create_admin_post' do
    
        if admin?
            
            erb :'admin/create_admin_post' 
        else
            flash[:danger] = "Only Admins Can Access This Page."
            redirect '/'
        end
    end
end