class User < ApplicationRecord
    
    has_many :posts
    has_many :comments, through: :posts
    has_many :messages, through: :conversations
    has_one_attached :avatar
    has_secure_password
    acts_as_messageable
    attr_accessor :remove_avatar

    validates :first_name, length: {minimum: 2, maximum: 20}
    validates :email_address, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :email_address, uniqueness: {message: "already exists. Please use another email address."}
    validates :username, uniqueness: {message: "already exists. Please choose another name."}, length: {minimum: 5, maximum: 20}  
    validates :password, length: {minimum: 7}
    validates :avatar, blob: { content_type: :image }

    # scope :fb_users, -> { where(fb_user: true) }
    

    def mailboxer_email(object)
        return self.email_address
    end
    
    def self.find_or_create_by_omniauth(auth_hash)
        oauth_email = auth_hash["info"]["email"]
        where(email_address: oauth_email).first_or_create do |user|
            user.oauth_token = auth_hash["credentials"]["token"]
            user.uid = auth_hash["uid"]
            user.provider = auth_hash["provider"]
            user.oauth_expires_at = Time.at(auth_hash["credentials"]["expires_at"])
            user.fb_img = auth_hash["info"]["image"] 
    
                if user.username.nil?
                    user.username = auth_hash["info"]["name"]
                end

                if user.first_name.nil?
                    user.first_name = auth_hash["info"]["name"]
                end

                if user.password.nil?
                    user.password = SecureRandom.hex
                end        
            user.save!
        end
    end

    after_save :purge_avatar, if: :remove_avatar

    private

    def purge_avatar
        avatar.purge_later
    end

end