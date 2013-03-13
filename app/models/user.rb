class User < ActiveRecord::Base
  attr_accessible :first_name
  attr_accessible :last_name
  attr_accessible :username
  attr_accessible :email

  has_many :flits
  
  def full_name
    self.first_name + ' ' + self.last_name
  end
  
end