class PostsController < ApplicationController

    before_action :authorize_user, only: [:edit, :update, :destroy, :new, :create]

    def index
        @posts = Post.all
    end

    def search
       @posts = Post.where("subject LIKE ?", "%" + params[:q] + "%") 
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
          flash[:success] = "Post successfully created."  
          redirect_to post_path(@post)
        else
          render :new
        end
        
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update_attributes(post_params)
            redirect_to posts_path(@post)
            flash[:success] = "Post successfully updated."
        else
            render :edit
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end

    private

    def post_params
        params.require(:post).permit(:subject, :body, :caption, :image, :user_id)
    end

end
