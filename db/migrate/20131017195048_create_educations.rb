class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.integer :resume_id
      t.string :institution
      t.string :degree
      t.string :field_of_study
      t.date :start_date
      t.date :end_date
      t.string :detail

      t.timestamps
    end
  end
end
