class SessionsController < ApplicationController
    
    def new
    end

    def create
        if auth_hash = request.env["omniauth.auth"]           
            oauth_email = request.env["omniauth.auth"]["info"]["email"]
            @user = User.find_or_create_by_omniauth(auth_hash)
            session[:user_id] = @user.id
            flash[:success] = "Signed in successfully via Facebook."
            redirect_to welcome_path
            @user.fb_user = true
        else
            @user = User.find_by(username: params[:username])            
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id 
                flash[:success] = "Signed in successfully."
                redirect_to welcome_path
            else
                flash[:danger] = "Invalid credentials. Please try logging in again."
                redirect_to login_path
            end
        end
    end

    def destroy
        session.delete(:user_id)
        flash[:danger] = "Successfully signed out."
        redirect_to welcome_path
    end
    
end
