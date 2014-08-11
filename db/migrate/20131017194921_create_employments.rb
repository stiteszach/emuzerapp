class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.integer :resume_id
      t.string :job_title
      t.string :company
      t.date :start_date
      t.date :end_date
      t.string :detail

      t.timestamps
    end
  end
end
