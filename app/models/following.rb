class Following < ActiveRecord::Base
  attr_accessible :followed_id, :follower_id, :integer

  belongs_to :user
  belongs_to :follower, :class_name => "User"

end
