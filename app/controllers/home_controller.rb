class HomeController < ApplicationController

    def welcome
        @user = User.new   
    end

    def feed
        @posts = Post.all.order("created_at DESC")
    end

end
