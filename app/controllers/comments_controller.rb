class CommentsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        @comment.user_id = session[:user_id]
        @comment.post_id = @post.id
        @comment.save
        redirect_to post_path(@post)
    end
    
    # def create
    #     @post = Post.find(params[:post_id])
    #     @comment = @post.comment.new(comment_params)
    #     @comment.user_id = @current_user.id
    #     @comment.post_id = @post.id
    #     @comment.save
    #     redirect_to post_path(@post)
    # end

    # def create
    #     @post = Post.new(post_params)
    #     @post.user_id = @current_user.id
    #     @post.save
    #     if @post.save
    #       redirect_to post_path(@post)
    #     else
    #       render :new
    #     end
        
    # end

    private

    def comment_params
        params.require(:comment).permit(:name, :body, :user_id, :post_id)
    end

end
