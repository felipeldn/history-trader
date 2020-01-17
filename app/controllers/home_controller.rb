class HomeController < ApplicationController

    def myprofile
        @user = User.find(session[:user_id])   
    end

    def feed
        @posts = Post.all.order("created_at DESC")
    end
    
end
