class Flit < ActiveRecord::Base
  attr_accessible :message
  attr_accessible :user_id

  belongs_to :user

  validates :message, :length => {:maximum => 160}
end
