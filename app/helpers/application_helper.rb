module ApplicationHelper

    def unread_messages_count
        # how to get the number of unread messages for the current user
        # using mailboxer
        @current_user.mailbox.inbox(:unread => true).count
    end

end
