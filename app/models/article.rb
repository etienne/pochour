class Article < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :title, :article
end
