class Post < ApplicationRecord

    belongs_to :user
    has_many :comments
    has_one_attached :image

    validates :body, length: {minimum: 50}
    validates :subject, length: {minimum: 2, maximum: 50}  
    validates :subject, uniqueness: {message: "A post with this subject name already exists. Please choose an alternative subject name."}
    validates :image, presence: true, blob: { content_type: :image }
  
  
    def image_presence
        errors.add(:image, "can't be blank") unless image.attached?
    end

end
