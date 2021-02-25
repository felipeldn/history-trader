class Post < ApplicationRecord

    belongs_to :user
    belongs_to :category
    has_many :comments
    has_one_attached :image
    # has_many_attached :images 

    has_many :commented_users, -> { distinct }, through: :comments, source: :user

    validates :body, length: {minimum: 50}
    validates :subject, length: {minimum: 2, maximum: 50}
    validates :subject, uniqueness: {message: "A post with this subject name already exists. Please choose an alternative subject name."}
    validates :image, presence: true, blob: { content_type: :image }

    scope :search, -> (q){where("subject LIKE ?", "%" + q + "%")}

    def user_name
        "#{self.user.username}"
    end

end
