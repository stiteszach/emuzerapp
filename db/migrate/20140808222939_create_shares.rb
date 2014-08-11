class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :resume_id
      t.string :url
      t.string :label

      t.timestamps
    end
  end
end
