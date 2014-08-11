class Skill < ActiveRecord::Base
  attr_accessible :resume_id, :skill
  belongs_to :resume
end
