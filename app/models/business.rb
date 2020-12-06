class Business < ActiveRecord::Base 
    belongs_to :user 
    belongs_to :category
    validates :category, presence: true
    has_many :comments, through: :user 
    has_one_attached :image



end 