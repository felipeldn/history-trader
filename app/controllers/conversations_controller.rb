class ConversationsController < ApplicationController


    def index
        @conversations = @current_user.mailbox.conversations
        #  - [@current_user.mailbox.trash]
    end

    def show
        @conversation = @current_user.mailbox.conversations.find(params[:id])
        @conversation.mark_as_read(@current_user)
        @recipients = @conversation.recipients
        @recipient = @recipients.find {|u| u[:id] != @current_user.id}
    end

    def new
        @recipients = User.all - [@current_user]
    end

    def create
        recipient = User.find(params[:user_id])
        receipt = @current_user.send_message(recipient, params[:body], params[:subject])
        flash[:success] = "New conversation successfully created."
        redirect_to conversation_path(receipt.conversation)
    end

    def destroy
        @conversation = @current_user.mailbox.conversations.find(params[:id])
        @conversation.destroy
        # @conversation.move_to_trash(@current_user)
        flash[:success] = 'The conversation was deleted.'
        redirect_to conversations_path
    end

end
