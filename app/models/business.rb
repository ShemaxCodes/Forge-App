class Business < ActiveRecord::Base 
    belongs_to :user, optional: true 
    belongs_to :category, optional: true 
    #validates :category, presence: true
    has_many :comments, through: :user 
    has_one_attached :image





end 