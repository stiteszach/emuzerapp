class Resume < ActiveRecord::Base
  attr_accessible :summary, :title, :user_id, :employments_attributes, :educations_attributes, :skills_attributes, :achievements_attributes

  belongs_to :user

  has_many :employments, :dependent => :destroy
  has_many :educations, :dependent => :destroy
  has_many :skills, :dependent => :destroy
  has_many :achievements, :dependent => :destroy
  has_many :shares, :dependent => :destroy

  accepts_nested_attributes_for :employments, :allow_destroy => true
  accepts_nested_attributes_for :educations, :allow_destroy => true
  accepts_nested_attributes_for :skills, :allow_destroy => true
  accepts_nested_attributes_for :achievements, :allow_destroy => true
  
end
