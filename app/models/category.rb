class Category < ActiveRecord::Base 
    has_many :businesses
    has_many :users, through: :businesses
    validates :title, presence: true

end 