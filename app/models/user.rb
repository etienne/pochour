class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :bio, :email, :password, :password_confirmation, :admin
  
  validates_length_of :bio, :maximum => 600
  
  has_many :articles
    
  extend FriendlyId
  friendly_id :name
end
