class CreateUsers < ActiveRecord::Migration
    def change
      create_table :businesses do |t|
        t.string :title
        t.string :city
        t.string :state
        t.integer :user_id
        t.integer :category_id

        
      end
   end
end