class Employment < ActiveRecord::Base
  attr_accessible :company, :detail, :end_date, :job_title, :resume_id, :start_date
  belongs_to :resume
end
