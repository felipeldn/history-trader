class User < ApplicationRecord
    has_many :posts
    has_many :comments
    has_secure_password

    validates :username, uniqueness: {message: "already exists. Please choose another name."}, length: {minimum: 5, maximum: 20}  
    validates :password, length: {minimum: 7, maximum: 30}

end