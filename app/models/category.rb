class Category < ApplicationRecord

    has_many :posts

    validates :name, length: {minimum: 3}

end
