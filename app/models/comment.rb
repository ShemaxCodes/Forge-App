class Comment < ActiveRecord::Base 

    belongs_to :user, optional: true  
    belongs_to :businesses, optional: true 

end 