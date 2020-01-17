class CommentsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        @comment.user_id = session[:user_id]
        @comment.post_id = @post.id
        @comment.save
        redirect_to post_path(@post)
    end

    private

    def comment_params
        params.require(:comment).permit(:name, :body, :user_id, :post_id)
    end

end
