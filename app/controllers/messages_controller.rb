class MessagesController < ApplicationController
    before_action :set_conversation

    def new
        @recipient = User.find(params[:recipient_id])
    end

    def create
        @receipt = @current_user.reply_to_conversation(@conversation, params[:body])
        flash[:primary] = "Message sent!"
        redirect_to conversation_path(@receipt.conversation)
    end

    private   

        def set_conversation
            @conversation = @current_user.mailbox.conversations.find(params[:conversation_id])
        end

end
