class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_one_attached :avatar
    has_secure_password
    acts_as_messageable

    validates :first_name, length: {minimum: 2, maximum: 20}
    validates :last_name, length: {minimum: 2, maximum: 20}
    validates :email_address, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :email_address, uniqueness: {message: "already exists. Please use another email address."}
    validates :username, uniqueness: {message: "already exists. Please choose another name."}, length: {minimum: 5, maximum: 20}  
    validates :password, length: {minimum: 7, maximum: 30}
    validates :avatar, blob: { content_type: :image }
  
    def mailboxer_email(object)
        return self.email_address
    end
end