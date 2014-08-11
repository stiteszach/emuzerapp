class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.integer :resume_id
      t.string :achievement
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
