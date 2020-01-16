class Post < ApplicationRecord

    belongs_to :user
    has_many :comments

    validates :body, length: {minimum: 60}
    validates :subject, length: {minimum: 2, maximum: 50}  
    validates :subject, uniqueness: {message: "A post with this subject name already exists. Please choose an alternative subject name."}

    def user_name
        self.user.username
    end

end
