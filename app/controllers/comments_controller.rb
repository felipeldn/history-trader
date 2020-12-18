class CommentsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        @comment.user_id = session[:user_id]
        @comment.post_id = @post.id
            # if @comment.body == !nil?
                @comment.save
                flash[:success] = "Comment successfully created."
                redirect_to post_path(@post)
            # else
            #     flash[:notice] = "Comment can't be blank"
            #     redirect_to post_path(@post)
            # end
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        flash[:warning] = "Comment successfully deleted."
        redirect_to post_path(@post) 
    end

    private

    def comment_params
        params.require(:comment).permit(:name, :body, :user_id, :post_id)
    end

end
