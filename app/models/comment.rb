class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  
  validates_presence_of :comment
end
