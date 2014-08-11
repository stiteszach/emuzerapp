class AddUserIndexToResumes < ActiveRecord::Migration
  def change
  	add_index :resumes, :user_id
  end
end
