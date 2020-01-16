class PostsController < ApplicationController

    before_action :authorize_user, only: [:edit, :update, :destroy, :new, :create]

    def index
        @posts = Post.all.order("created_at DESC")
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = @current_user.id
        @post.save
        if @post.save
          flash[:notice] = "Post successfully created"  
          redirect_to post_path(@post)
        else
          render :new
        end
        
    end

    def edit
    end

    def update
        @post.update(post_params)
        redirect_to @post
    end

    def destroy
        @post.destroy
        redirect_to posts_path
    end

    private

    def post_params
        params.require(:post).permit(:subject, :body, :img_url, :user_id)
    end

end
