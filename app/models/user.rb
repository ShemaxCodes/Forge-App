class User < ActiveRecord::Base 

    has_secure_password
    has_many :comments
    has_many :comments, through: :businesses
    has_many :businesses

    validates_presence_of :username
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    validates :password, confirmation: { case_sensitive: true }

end 