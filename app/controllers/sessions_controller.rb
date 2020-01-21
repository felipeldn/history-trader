class SessionsController < ApplicationController
    
    def new
    end

    def create
        @user = User.find_by(username: params[:username])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to feed_path, notice: "Signed in successfully"
            else
                flash[:errors] = ["Invalid credentials"]
                redirect_to login_path
        end    
    end

    def destroy
        session.delete(:user_id)
        redirect_to welcome_path, notice: "Signed out"
        # session.delete(:user_id)
        # # redirect_to signup_path
        # redirect_back(fallback_location: signup_path)
    end
    
end
