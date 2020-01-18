class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to feed_path
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def edit
        @user = User.find(session[:user_id])
    end

    def update
        @user = User.find(session[:user_id])
        if @user.update_attributes(user_params)
            redirect_to myprofile_path
            flash[:notice] = "User account successfully updated"
        else
            render :edit
        end
    end

    def destroy
        @current_user.destroy
        session.destroy
        flash[:notice] = "User account successfully deleted"
        redirect_to welcome_path
    end


    private

    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :avatar, :email_address, :password, :password_confirmation)
    end

end
