class User < ActiveRecord::Base 

    has_secure_password
    has_many :comments
    has_many :businesses

    validates_presence_of :username, :email
    validates :password, confirmation: { case_sensitive: true }

end 