class Comment < ApplicationRecord

    belongs_to :user
    belongs_to :post

    validates :body, {message: "Comments must be longer than 2 characters."}, length: {minimum: 2}

    # def user_name
    #     self.user.username
    # end

end
