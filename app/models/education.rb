class Education < ActiveRecord::Base
  attr_accessible :degree, :detail, :end_date, :field_of_study, :institution, :resume_id, :start_date
  belongs_to :resume
end
