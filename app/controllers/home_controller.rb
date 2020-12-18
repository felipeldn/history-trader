class HomeController < ApplicationController

    def welcome
        @posts = Post.all.order("created_at DESC")
    end


    
end
