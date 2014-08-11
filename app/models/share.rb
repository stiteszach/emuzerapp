class Share < ActiveRecord::Base
  attr_accessible :label, :resume_id, :url

  belongs_to :resume

  before_validation :generate_hash

  require 'securerandom'

  private
  def generate_hash
  	self.url = SecureRandom.urlsafe_base64(5)
  end

end
