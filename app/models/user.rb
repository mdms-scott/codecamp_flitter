class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name
  attr_accessible :last_name
  attr_accessible :username
  attr_accessible :email

  has_many :flits, :dependent => :destroy
  has_many :followings
  has_many :followers, :through => :followings, :foreign_key => :follower_id


  validates :username, :uniqueness => true, :length => {:minimum => 4}
  
  def full_name
    self.first_name + ' ' + self.last_name
  end

  def followed_users
    users = []
    reverse_followings = Following.all.select {|x| x.follower_id == self.id}
    reverse_followings.each do |rf|
      users << rf.user
    end

    users
  end
  
end