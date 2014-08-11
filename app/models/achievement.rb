class Achievement < ActiveRecord::Base
  attr_accessible :achievement, :end_date, :resume_id, :start_date
  belongs_to :resume
end
