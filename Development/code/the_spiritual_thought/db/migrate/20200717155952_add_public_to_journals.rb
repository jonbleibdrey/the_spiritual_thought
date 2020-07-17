class AddPublicToJournals < ActiveRecord::Migration
  def change
    add_column :journals, :public, :boolean 
  end
end
