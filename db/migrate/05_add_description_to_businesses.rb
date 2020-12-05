class AddDescriptionToBusinesses < ActiveRecord::Migration[6.0]
    def change
      add_column :businesses, :description, :string
    end
  end